library(Directional)


### Name: Spherical and hyperspherical median
### Title: Fast calculation of the spherical and hyperspherical median
### Aliases: mediandir mediandir_2
### Keywords: Median direction

### ** Examples

m <- rnorm(3)
m <- m / sqrt( sum(m^2) )
x <- rvmf(100, m, 10)
mediandir(x)
mediandir_2(x)



