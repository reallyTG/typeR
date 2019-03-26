library(mclust)


### Name: plot.MclustBootstrap
### Title: Plot of bootstrap distributions for mixture model parameters
### Aliases: plot.MclustBootstrap
### Keywords: cluster

### ** Examples

## Not run: 
##D data(diabetes)
##D X <- diabetes[,-1]
##D modClust <- Mclust(X, G = 3, modelNames = "VVV")
##D bootClust <- MclustBootstrap(modClust, nboot = 99)
##D par(mfrow = c(1,3), mar = c(4,2,2,0.5))
##D plot(bootClust, what = "pro")
##D par(mfrow = c(3,3), mar = c(4,2,2,0.5))
##D plot(bootClust, what = "mean")
## End(Not run)



