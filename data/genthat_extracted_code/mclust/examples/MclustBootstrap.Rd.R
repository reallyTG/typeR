library(mclust)


### Name: MclustBootstrap
### Title: Resampling-based Inference for Gaussian finite mixture models
### Aliases: MclustBootstrap print.MclustBootstrap
### Keywords: htest cluster

### ** Examples

## Not run: 
##D data(diabetes)
##D X <- diabetes[,-1]
##D modClust <- Mclust(X) 
##D bootClust <- MclustBootstrap(modClust)
##D summary(bootClust, what = "se")
##D summary(bootClust, what = "ci")
##D 
##D data(acidity)
##D modDens <- densityMclust(acidity)
##D modDens <- MclustBootstrap(modDens)
##D summary(modDens, what = "se")
##D summary(modDens, what = "ci")
## End(Not run)



