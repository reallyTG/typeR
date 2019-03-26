library(mclust)


### Name: emE
### Title: EM algorithm starting with E-step for a parameterized Gaussian
###   mixture model.
### Aliases: emE emV emX emEII emVII emEEI emVEI emEVI emVVI emEEE emEEV
###   emVEV emVVV emEVE emEVV emVEE emVVE emXII emXXI emXXX
### Keywords: cluster

### ** Examples

## Not run: 
##D msEst <- mstepEEE(data = iris[,-5], z = unmap(iris[,5]))
##D names(msEst)
##D 
##D emEEE(data = iris[,-5], parameters = msEst$parameters)
## End(Not run)



