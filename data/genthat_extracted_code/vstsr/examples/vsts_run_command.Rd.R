library(vstsr)


### Name: vsts_run_command
### Title: Visual Studio Custom API Calls
### Aliases: vsts_run_command

### ** Examples

## Not run: 
##D auth_key <- vsts_auth_key('<username>', '<password>')
##D #Get commits of a repository
##D URL <- paste0('https://{accountName}.visualstudio.com/{project}',
##D               '/_apis/git/repositories/{repositoryId}/commits/',
##D               '{commitId}?api-version=4.1-preview')
##D vsts_run_command(URL, 'GET', auth_key)
## End(Not run)




