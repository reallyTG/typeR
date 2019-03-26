library(glmmBUGS)


### Name: popDataAdjMat
### Title: Data set containing an adjacency matrix
### Aliases: popDataAdjMat
### Keywords: datasets

### ** Examples

## Not run: 
##D library('diseasemapping')
##D data('popdata')
##D popDataAdjMat = spdep::poly2nb(popdata,
##D 	row.names=as.character(popdata$CSDUID))
## End(Not run)
data('popDataAdjMat')
summary(popDataAdjMat)
attributes(popDataAdjMat)$region.id[1:10]



