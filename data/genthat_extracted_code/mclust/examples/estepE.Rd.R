library(mclust)


### Name: estepE
### Title: E-step in the EM algorithm for a parameterized Gaussian mixture
###   model.
### Aliases: estepE estepV estepEII estepVII estepEEI estepVEI estepEVI
###   estepVVI estepEEE estepEEV estepVEV estepVVV estepEVE estepEVV
###   estepVEE estepVVE
### Keywords: cluster

### ** Examples

## Not run: 
##D msEst <- mstepEII(data = iris[,-5], z = unmap(iris[,5]))
##D names(msEst)
##D 
##D estepEII(data = iris[,-5], parameters = msEst$parameters)
## End(Not run)



