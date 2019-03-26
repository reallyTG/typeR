library(DepthProc)


### Name: fncGetBand
### Title: Functional bands
### Aliases: fncGetBand

### ** Examples


x <- matrix(rnorm(600), nc = 20)
obj <- fncDepth(x, method = "FM", dep1d = "Mahalanobis")
fncGetBand(obj)




