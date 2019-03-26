library(sdm)


### Name: subset
### Title: Subset models in a sdmModels object
### Aliases: subset subset,sdmModels-method [[,sdmModels,ANY,ANY-method
### Keywords: spatial

### ** Examples

## Not run: 
##D file <- system.file("external/model.sdm", package="sdm")
##D 
##D m <- read.sdm(file)
##D 
##D m
##D 
##D getModelInfo(m)
##D 
##D 
##D m1 <- m[[3:4]]
##D 
##D m1
##D 
##D getModelInfo(m1)
##D 
##D m2 <- m[[3:4,drop=FALSE]]
##D 
##D m2
##D 
##D getModelInfo(m2)
##D 
##D #---- the following is the same as previous:
##D 
##D m2 <- subset(m,3:4,drop=FALSE)
##D 
##D m2
##D 
##D getModelInfo(m2)
## End(Not run) 



