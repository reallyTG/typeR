library(archivist)


### Name: removeTagsRepo
### Title: Remove Tags from Repository
### Aliases: removeTagsRepo

### ** Examples

## Not run: 
##D # Creating empty repository
##D exampleRepoDir <- tempfile()
##D createLocalRepo(exampleRepoDir, force=TRUE)
##D 
##D # Saving lm artifacts into repository
##D m1 <- lm(Sepal.Length~Species, iris)
##D saveToLocalRepo(m1, exampleRepoDir)
##D 
##D # We may see what kind of Tags are related to "m1" artifact corresponding to
##D getTagsLocal("9e66edd297c2f291446f3503c01d443a", exampleRepoDir, "")
##D 
##D # One more look at our Repo
##D removeTagsRepo("9e66edd297c2f291446f3503c01d443a", exampleRepoDir, tags = "rank:3")
##D 
##D # Deleting example repository
##D deleteLocalRepo(exampleRepoDir, deleteRoot=TRUE)
##D rm(exampleRepoDir)
## End(Not run)




