library(mclust)


### Name: mclust2Dplot
### Title: Plot two-dimensional data modelled by an MVN mixture.
### Aliases: mclust2Dplot
### Keywords: cluster

### ** Examples

## Not run: 
##D faithfulModel <- Mclust(faithful)
##D 
##D mclust2Dplot(faithful, parameters=faithfulModel$parameters, 
##D              z=faithfulModel$z, what = "classification", main = TRUE)
##D 
##D mclust2Dplot(faithful, parameters=faithfulModel$parameters, 
##D              z=faithfulModel$z, what = "uncertainty", main = TRUE)
## End(Not run)



