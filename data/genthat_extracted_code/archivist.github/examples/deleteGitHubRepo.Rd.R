library(archivist.github)


### Name: deleteGitHubRepo
### Title: Delete the Existing GitHub Repository
### Aliases: deleteGitHubRepo

### ** Examples

## Not run: 
##D 
##D authoriseGitHub(ClientID, ClientSecret, 
##D                 scope = c("public_repo", "delete_repo")) -> github_token
##D # authoriseGitHub also does: aoptions("github_token", github_token)
##D aoptions("user", user.name)
##D aoptions("password", user.password)
##D 
##D createGitHubRepo("Museum")
##D deleteGitHubRepo(repo = "Museum", deleteRoot = TRUE, response = TRUE)
##D 
## End(Not run)




