library(archivist.github)


### Name: cloneGitHubRepo
### Title: Clone Github Repository
### Aliases: cloneGitHubRepo

### ** Examples

## Not run: 
##D 
##D cloneGitHubRepo("https://github.com/MarcinKosinski/Museum")
##D cloneGitHubRepo("https://github.com/MarcinKosinski/Museum-Extra")
##D 
##D 
##D # empty Github Repository creation
##D authoriseGitHub(ClientID, ClientSecret) -> github_token
##D # authoriseGitHub also does: aoptions("github_token", github_token)
##D aoptions("user", user.name)
##D aoptions("password", user.password)
##D 
##D createEmptyGithubRepo("archive-test4")
##D setRemotebRepo(aoptions("name"), "archive-test4")
##D ## artifact's archiving
##D example <- 1:100
##D 
##D # archiving
##D archive(example) -> md5hash_path
##D 
##D ## proof that artifact is really archived
##D showRemoteRepo() # uses options from setGithubRepo
##D # let's remove przyklad
##D rm(example)
##D # and load it back from md5hash_path
##D aread(md5hash_path)
##D 
##D 
##D # clone example
##D unlink("archive-test", recursive = TRUE)
##D cloneGitHubRepo('https://github.com/MarcinKosinski/archive-test')
##D setRemoteRepo(aoptions("name"), "archive-test")
##D # equivalent is cloneGitHubRepo('https://github.com/MarcinKosinski/archive-test', default = TRUE)
##D # check if default is set with
##D # aoptions('repoDir'); aoptions('repo'); aoptions('user')
##D data(iris)
##D archive(iris)
##D showRemoteRepo()
##D 
##D 
## End(Not run)



