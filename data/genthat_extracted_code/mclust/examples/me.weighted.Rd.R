library(mclust)


### Name: me.weighted
### Title: EM algorithm with weights starting with M-step for parameterized
###   MVN mixture models
### Aliases: me.weighted
### Keywords: cluster

### ** Examples

## Not run: 
##D w <- rep(1,150)
##D w[1] <- 0
##D me.weighted(modelName = "VVV", data = iris[,-5], z = unmap(iris[,5]),weights=w)
## End(Not run)



