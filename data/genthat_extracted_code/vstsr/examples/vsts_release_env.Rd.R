library(vstsr)


### Name: vsts_deploy_release
### Title: Visual Studio Project Release Environment Information
### Aliases: vsts_deploy_release

### ** Examples

#Add in own details to get a non-NULL output
auth_key <- vsts_auth_key('<username>', '<password>')
vsts_deploy_release('domain', 'project', auth_key, 1, 1)




