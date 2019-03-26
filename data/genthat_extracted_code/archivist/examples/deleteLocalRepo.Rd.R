library(archivist)


### Name: deleteLocalRepo
### Title: Delete the Existing Repository from the Given Directory
### Aliases: deleteLocalRepo deleteRepo

### ** Examples

## Not run: 
##D exampleRepoDir <- tempfile()
##D createLocalRepo( repoDir = exampleRepoDir, default =  TRUE )
##D data(iris)
##D saveToLocalRepo(iris)
##D deleteLocalRepo( repoDir = exampleRepoDir, unset = TRUE, deleteRoot = TRUE)
## End(Not run)




