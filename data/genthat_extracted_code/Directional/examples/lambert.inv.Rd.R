library(Directional)


### Name: Inverse of Lambert's equal area projection
### Title: Inverse of Lambert's equal area projection
### Aliases: lambert.inv
### Keywords: Lambert's equal area projection Inverse transformation

### ** Examples

m <- rnorm(3)
m <- m / sqrt( sum(m^2) )
x <- rvmf(20, m, 19)
mu <- vmf(x)$mu
y <- lambert( euclid.inv(x) )
lambert.inv(y, mu)
euclid.inv(x)



