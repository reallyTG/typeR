library(archivist.github)


### Name: archivist-github-integration
### Title: Archivist Integration With GitHub
### Aliases: archivist-github-integration agithub

### ** Examples

## Not run: 
##D authoriseGitHub(ClientID, ClientSecret) -> github_token
##D # authoriseGitHub also does: aoptions("github_token", github_token)
##D aoptions("user", user.name)
##D aoptions("password", user.password)
##D 
##D ## here github_token is used
##D createGitHubRepo("Museum")
##D createGitHubRepo("Museum-Extras", response = TRUE)
##D createGitHubRepo("Gallery", readme = NULL)
##D createGitHubRepo("Landfill", 
##D repoDescription = "My models and stuff")
##D 
## End(Not run)



