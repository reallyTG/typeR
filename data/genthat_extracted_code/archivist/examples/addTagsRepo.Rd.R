library(archivist)


### Name: addTagsRepo
### Title: Add new Tags to the Existing Repository
### Aliases: addTagsRepo

### ** Examples

## Not run: 
##D 
##D ## We Take all artifacts of lm class from repository, 
##D ## extract R^2 for them and store as R^2:number Tags
##D 
##D # Creating empty repository
##D exampleRepoDir <- tempfile()
##D createLocalRepo(exampleRepoDir, force=TRUE)
##D 
##D # Saving lm artifacts into repository
##D m1 <- lm(Sepal.Length~Species, iris)
##D saveToLocalRepo(m1, exampleRepoDir)
##D m2 <- lm(Sepal.Width~Species, iris)
##D saveToLocalRepo(m2, exampleRepoDir)
##D 
##D # We may see what kind of Tags are related to "m1" artifact corresponding to
##D # "9e66edd297c2f291446f3503c01d443a" md5hash
##D getTagsLocal("9e66edd297c2f291446f3503c01d443a", exampleRepoDir, "")
##D 
##D # We may see what kind of Tags are related to "m2" artifact corresponding to
##D # "da1bcaf68752c146903f700c1a458438" md5hash
##D getTagsLocal("da1bcaf68752c146903f700c1a458438", exampleRepoDir, "")
##D 
##D # We Take all objects of lm class from repository
##D md5hashes <- searchInLocalRepo(repoDir=exampleRepoDir, "class:lm")
##D 
##D # Adding new tag "test" explicitly
##D addTagsRepo(md5hashes, exampleRepoDir, tags = "test")
##D 
##D # Adding new tag "R^2: " using FUN parameter
##D addTagsRepo(md5hashes, exampleRepoDir, function(x) paste0("R^2:",summary(x)$r.square))
##D 
##D # And now: Tags related to "m1" artifact are
##D getTagsLocal("9e66edd297c2f291446f3503c01d443a", exampleRepoDir, "")
##D 
##D # And now: Tags related to "m2" artifact are
##D getTagsLocal("da1bcaf68752c146903f700c1a458438", exampleRepoDir, "")
##D 
##D # One more look at our Repo
##D showLocalRepo(exampleRepoDir, method = "tags")
##D 
##D # Deleting example repository
##D deleteLocalRepo(exampleRepoDir, deleteRoot=TRUE)
##D rm(exampleRepoDir)
## End(Not run)




