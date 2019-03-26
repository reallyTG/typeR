library(GSE)


### Name: get-methods
### Title: Accessor methods to the essential slots of classes CovRobMiss,
###   TSGS, GSE, emve, and HuberPairwise
### Aliases: getDist getDist-methods getDistAdj getDistAdj-methods getDim
###   getDim-methods getLocation getLocation-methods getScatter
###   getScatter-methods getMissing getMissing-methods getOutliers
###   getOutliers-methods getScale getScale-methods getFiltDat
###   getFiltDat-methods
### Keywords: get methods

### ** Examples

## Not run: 
##D data(boston)
##D res <- GSE(boston)
##D 
##D ## extract estimated location
##D getLocation(res)
##D 
##D ## extract estimated scatter
##D getScatter(res)
##D 
##D ## extract estimated adjusted distances
##D getDistAdj(res)
##D 
##D ## extract outliers
##D getOutliers(res)
## End(Not run)


