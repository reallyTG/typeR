library(spatstat)


### Name: dppkernel
### Title: Extract Kernel from Determinantal Point Process Model Object
### Aliases: dppkernel
### Keywords: spatial models

### ** Examples

kernelMatern <- dppkernel(dppMatern(lambda = 100, alpha=.01, nu=1, d=2))
plot(kernelMatern, xlim = c(0,0.1))



