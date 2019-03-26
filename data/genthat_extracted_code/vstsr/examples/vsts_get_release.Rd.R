library(vstsr)


### Name: vsts_get_releases
### Title: Visual Studio Project Release Information
### Aliases: vsts_get_releases vsts_get_release

### ** Examples

#Add in own details to get a non-NULL output
auth_key <- vsts_auth_key('<username>', '<password>')
vsts_get_releases('domain', 'project', auth_key)




