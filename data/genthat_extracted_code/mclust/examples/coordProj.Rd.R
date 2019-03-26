library(mclust)


### Name: coordProj
### Title: Coordinate projections of multidimensional data modeled by an
###   MVN mixture.
### Aliases: coordProj
### Keywords: cluster

### ** Examples

## Not run: 
##D est <- meVVV(iris[,-5], unmap(iris[,5]))
##D par(pty = "s", mfrow = c(1,1))
##D coordProj(iris[,-5], dimens=c(2,3), parameters = est$parameters, z = est$z,
##D           what = "classification", main = TRUE) 
##D coordProj(iris[,-5], dimens=c(2,3), parameters = est$parameters, z = est$z,
##D           truth = iris[,5], what = "errors", main = TRUE) 
##D coordProj(iris[,-5], dimens=c(2,3), parameters = est$parameters, z = est$z,
##D           what = "uncertainty", main = TRUE) 
## End(Not run)



