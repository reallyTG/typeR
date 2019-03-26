library(spatstat)


### Name: rVarGamma
### Title: Simulate Neyman-Scott Point Process with Variance Gamma cluster
###   kernel
### Aliases: rVarGamma
### Keywords: spatial datagen

### ** Examples

 # homogeneous
 X <- rVarGamma(30, 2, 0.02, 5)
 # inhomogeneous
 ff <- function(x,y){ exp(2 - 3 * abs(x)) }
 Z <- as.im(ff, W= owin())
 Y <- rVarGamma(30, 2, 0.02, Z)
 YY <- rVarGamma(ff, 2, 0.02, 3)



