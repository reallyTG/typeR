library(vstsr)


### Name: vsts_get_build_defs
### Title: Visual Studio Project Build Definition Information
### Aliases: vsts_get_build_defs

### ** Examples

#Add in own details to get a non-NULL output
auth_key <- vsts_auth_key('<username>', '<password>')
vsts_get_build_defs('domain', 'project', auth_key)




