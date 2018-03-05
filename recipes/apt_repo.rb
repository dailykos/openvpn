apt_repository "openvpn" do
  uri          "http://build.openvpn.net/debian/openvpn/release/#{node[:openvpn][:major_version]}"
  components   [ "main" ]
  distribution node[:lsb][:codename]
  key          "https://swupdate.openvpn.net/repos/repo-public.gpg"
end

# Make sure the Apt cache is updated
node.override['apt']['compile_time_update'] = true
include_recipe 'apt'
