library(archivist.github)


### Name: archive
### Title: Archive Artifact to Local and GitHub Repository
### Aliases: archive

### ** Examples

## Not run: 
##D 
##D # empty GitHub Repository creation
##D authoriseGitHub(ClientID, ClientSecret) -> github_token
##D # authoriseGitHub also does: aoptions("github_token", github_token)
##D aoptions("user", user.name)
##D aoptions("password", user.password)
##D 
##D createGitHubRepo("archive-test4", default = TRUE)
##D ## artifact's archiving
##D exampleVec <- 1:100
##D 
##D # archiving
##D archive(exampleVec) -> md5hash_path
##D 
##D ## proof that artifact is really archived
##D showGithubRepo() # uses options from setGithubRepo
##D # let's remove exampleVec
##D rm(exampleVec)
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
##D ## alink() option
##D vectorLong <- 1:100
##D vectorShort <- 1:20
##D # archiving
##D alink(archive(vectorLong))
##D archive(vectorShort, alink = TRUE)
##D showRemoteRepo()
##D 
##D 
## End(Not run)



