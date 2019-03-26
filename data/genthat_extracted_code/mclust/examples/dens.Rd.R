library(mclust)


### Name: dens
### Title: Density for Parameterized MVN Mixtures
### Aliases: dens
### Keywords: cluster

### ** Examples

## Not run: 
##D faithfulModel <- Mclust(faithful)
##D Dens <- dens(modelName = faithfulModel$modelName, data = faithful,
##D              parameters = faithfulModel$parameters)
##D Dens
##D 
##D ## alternative call
##D do.call("dens", faithfulModel)
## End(Not run)



