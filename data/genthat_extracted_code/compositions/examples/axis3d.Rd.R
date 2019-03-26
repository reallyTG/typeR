library(compositions)


### Name: axis3D
### Title: Drawing a 3D coordiante system to a plot, based on package rgl
### Aliases: axis3D
### Keywords: multivariate

### ** Examples

x <- cbind(rnorm(10),rnorm(10),rnorm(10))
plot3D(x)
x0 <- x*0
arrows3D(x0,x)



