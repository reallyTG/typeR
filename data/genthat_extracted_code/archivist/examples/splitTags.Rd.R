library(archivist)


### Name: splitTagsLocal
### Title: Split Tags in Repository
### Aliases: splitTagsLocal splitTagsRemote

### ** Examples

## Not run: 
##D ## LOCAL VERSION 
##D 
##D setLocalRepo(system.file("graphGallery", package = "archivist"))
##D head(showLocalRepo(method = "tags"))
##D head(splitTagsLocal() )
##D 
##D ## Github Version
##D # Let's check how does table tag look like while we are using the
##D # Gitub repository.
##D # We will choose only special columns of data frames that show Tags
##D head(showRemoteRepo( user = "pbiecek", repo = "archivist", method = "tags" )[,2])
##D head(splitTagsRemote( user = "pbiecek", repo = "archivist" )[,2:3])
##D 
##D head(splitTagsRemote("PieczaraPietraszki", "BetaAndBit", "master", "UniwersytetDzieci/arepo"))
## End(Not run)



