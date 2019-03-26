library(Directional)


### Name: Lambert's equal area projection
### Title: Lambert's equal area projection
### Aliases: lambert
### Keywords: Lambert's equal area projection Spherical data

### ** Examples

x <- rvmf(100, rnorm(3), 20)
x <- euclid.inv(x)
a <- lambert(x)
plot(a)



