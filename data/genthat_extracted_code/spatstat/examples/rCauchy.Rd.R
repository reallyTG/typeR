library(spatstat)


### Name: rCauchy
### Title: Simulate Neyman-Scott Point Process with Cauchy cluster kernel
### Aliases: rCauchy
### Keywords: spatial datagen

### ** Examples

 # homogeneous
 X <- rCauchy(30, 0.01, 5)
 # inhomogeneous
 ff <- function(x,y){ exp(2 - 3 * abs(x)) }
 Z <- as.im(ff, W= owin())
 Y <- rCauchy(50, 0.01, Z)
 YY <- rCauchy(ff, 0.01, 5)



