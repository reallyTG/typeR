library(sdm)


### Name: roc
### Title: plot ROC curves
### Aliases: roc getRoc roc,vector,vector-method roc,sdmModels-method
###   roc,sdmModels,ANY-method getRoc,vector,vector-method
###   getRoc,sdmModels,ANY-method
### Keywords: spatial,species,data

### ** Examples

## Not run: 
##D file <- system.file("external/model.sdm", package="sdm")
##D 
##D m <- read.sdm(file) # a sdmModels Object (fitted using sdm function)
##D 
##D roc(m)
##D 
##D roc(m,1) # for the first model
##D 
##D roc(m, 1:2)
##D 
##D roc(m,method = 'glm',smooth = T) # only for models fitted using glm method & with smoothed curve
##D 
##D 
## End(Not run)



