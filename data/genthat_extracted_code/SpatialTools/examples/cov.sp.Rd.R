library(SpatialTools)


### Name: cov.sp
### Title: Calculates spatial covariance
### Aliases: cov.sp
### Keywords: covariance spatial

### ** Examples

    coords <- matrix(rnorm(30), ncol = 3)
    cov.sp(coords = coords, sp.type = "exponential", sp.par = c(2, 1),
        error.var = 1)



