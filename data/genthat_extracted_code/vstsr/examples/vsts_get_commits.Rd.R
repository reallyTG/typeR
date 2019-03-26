library(vstsr)


### Name: vsts_get_commits
### Title: Visual Studio Project Git Repositories
### Aliases: vsts_get_commits

### ** Examples

#Add in own details to get a non-NULL output
auth_key <- vsts_auth_key('<username>', '<password>')
vsts_get_commits('domain', 'project', 'repo', auth_key)




