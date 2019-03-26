library(vstsr)


### Name: vsts_get_repos
### Title: Visual Studio Project Repositories
### Aliases: vsts_get_repos vsts_create_repo vsts_delete_repo

### ** Examples

#Add in own details to get a non-NULL output
auth_key <- vsts_auth_key('<username>', '<password>')

#Get repo list
vsts_get_repos('domain', 'project', auth_key)

#Create new repo
vsts_create_repo('domain', 'project', 'repo', auth_key)

#Delete existing repo
vsts_delete_repo('domain', 'project', 'repo', auth_key)





