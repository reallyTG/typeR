library(hyperSpec)


### Name: cov,hyperSpec,missing-method
### Title: Covariance matrices for hyperSpec objects
### Aliases: cov,hyperSpec,missing-method pooled.cov

### ** Examples

image (cov (chondro))
pcov <-  pooled.cov (chondro, chondro$clusters)
plot (pcov$means)
image (pcov$COV)




