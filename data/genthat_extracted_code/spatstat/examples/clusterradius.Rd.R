library(spatstat)


### Name: clusterradius
### Title: Compute or Extract Effective Range of Cluster Kernel
### Aliases: clusterradius clusterradius.character clusterradius.kppm
### Keywords: spatial

### ** Examples

  fit <- kppm(redwood ~ x, "MatClust")
  clusterradius(fit)

  clusterradius("Thomas", scale = .1)
  clusterradius("Thomas", scale = .1, thresh = 0.001)
  clusterradius("VarGamma", scale = .1, nu = 2, precision = TRUE)



