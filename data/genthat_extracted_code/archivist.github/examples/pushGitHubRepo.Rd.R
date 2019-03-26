library(archivist.github)


### Name: pushGitHubRepo
### Title: Push and Pull for Repository
### Aliases: pushGitHubRepo pullGithubRepo pullGitHubRepo

### ** Examples

## Not run: 
##D 
##D authoriseGitHub(ClientID, ClientSecret) -> github_token
##D # authoriseGitHub also does: aoptions("github_token", github_token)
##D aoptions("user", user.name)
##D aoptions("password", user.password)
##D 
##D createGitHubRepo("Museum", default = TRUE) # here github_token is used
##D data(iris)
##D saveToLocalRepo(iris)
##D git2r::status(repository('Museum'))
##D pushGitHubRepo(commitMessage = "add iris")
##D git2r::status(repository('Museum'))
##D 
## End(Not run)



