library(compositions)


### Name: arrows3D
### Title: arrows in 3D, based on package rgl
### Aliases: arrows3D arrows3D.default
### Keywords: multivariate

### ** Examples

x <- cbind(rnorm(10),rnorm(10),rnorm(10))
plot3D(x)
x0 <- x*0
arrows3D(x0,x)



