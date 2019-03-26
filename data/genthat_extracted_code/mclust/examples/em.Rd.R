library(mclust)


### Name: em
### Title: EM algorithm starting with E-step for parameterized Gaussian
###   mixture models.
### Aliases: em
### Keywords: cluster

### ** Examples

## Not run: 
##D msEst <- mstep(modelName = "EEE", data = iris[,-5], 
##D                z = unmap(iris[,5]))
##D names(msEst)
##D 
##D em(modelName = msEst$modelName, data = iris[,-5],
##D    parameters = msEst$parameters)
##D 
##D do.call("em", c(list(data = iris[,-5]), msEst))   ## alternative call
## End(Not run)



