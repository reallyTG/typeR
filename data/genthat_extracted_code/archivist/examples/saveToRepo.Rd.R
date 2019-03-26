library(archivist)


### Name: saveToLocalRepo
### Title: Save an Artifact into a Repository
### Aliases: saveToLocalRepo saveToRepo asave

### ** Examples

## Not run: 
##D exampleRepoDir <- tempfile(tmpdir = ".")
##D createLocalRepo(repoDir = exampleRepoDir)
##D data(swiss)
##D saveToLocalRepo(swiss, repoDir=exampleRepoDir, archiveSessionInfo = TRUE)
##D showLocalRepo(method = "md5hashes", repoDir = exampleRepoDir)
##D showLocalRepo(method = "tags", repoDir = exampleRepoDir)
##D 
##D loadFromLocalRepo(md5hash = '2a6e492cb6982f230e48cf46023e2e4f',
##D   repoDir = system.file("graphGallery", package = "archivist"), value = TRUE) -> model
##D 
##D saveToLocalRepo(model, repoDir=exampleRepoDir,
##D              userTags = c("do not delete", "my favourite model"))
##D aoptions('repoDir', system.file("graphGallery", package = "archivist"))
##D showLocalRepo(method = "tags")
##D data(iris)
##D asave(iris, silent = FALSE) # iris was used in pl
##D aoptions('repoDir', NULL, unset = TRUE)
##D deleteLocalRepo(exampleRepoDir, TRUE)
##D rm(exampleRepoDir)
## End(Not run)




