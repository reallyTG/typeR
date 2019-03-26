library(spatstat)


### Name: clusterkernel
### Title: Extract Cluster Offspring Kernel
### Aliases: clusterkernel clusterkernel.character clusterkernel.kppm
### Keywords: spatial

### ** Examples

  fit <- kppm(redwood ~ x, "MatClust")
  f <- clusterkernel(fit)
  f(0.1, 0.2)



