library(archivist.github)


### Name: createGitHubRepo
### Title: Create an Empty Repository on GitHub
### Aliases: createGitHubRepo

### ** Examples

## Not run: 
##D # empty GitHub Repository creation
##D authoriseGitHub(ClientID, ClientSecret) -> github_token
##D # authoriseGitHub also does: aoptions("github_token", github_token)
##D aoptions("user", user.name)
##D aoptions("password", user.password)
##D 
##D createGitHubRepo("Museum")
##D createGitHubRepo("Museum-Extras", response = TRUE)
##D createGitHubRepo("Gallery", readmeDescription = NULL)
##D createGitHubRepo("Landfill", 
##D repoDescription = "My models and stuff") 
##D createGitHubRepo("MuseumYYYY", repoDir = "Museum_YY")
##D createGitHubRepo("archive-test4", default = TRUE)
##D 
##D ## artifact's archiving
##D przyklad <- 1:100
##D 
##D # archiving
##D archive(przyklad) -> md5hash_path
##D 
##D ## proof that artifact is really archived
##D showRemoteRepo() # uses options from setGithubRepo
##D # let's remove przyklad
##D rm(przyklad)
##D # and load it back from md5hash_path
##D aread(md5hash_path)
##D 
##D 
##D # clone example
##D unlink("archive-test", recursive = TRUE)
##D cloneGithubRepo('https://github.com/MarcinKosinski/archive-test')
##D setRemoteRepo(aoptions("user"), "archive-test")
##D data(iris)
##D archive(iris)
##D showRemoteRepo()
##D 
## End(Not run)



