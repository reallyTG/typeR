library(mclust)


### Name: estep
### Title: E-step for parameterized Gaussian mixture models.
### Aliases: estep
### Keywords: cluster

### ** Examples

## Not run: 
##D msEst <- mstep(modelName = "VVV", data = iris[,-5], z = unmap(iris[,5]))
##D names(msEst)
##D 
##D estep(modelName = msEst$modelName, data = iris[,-5],
##D       parameters = msEst$parameters)
## End(Not run)



