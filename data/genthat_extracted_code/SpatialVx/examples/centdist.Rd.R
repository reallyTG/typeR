library(SpatialVx)


### Name: centdist
### Title: Centroid Distance Between Two Identified Objects
### Aliases: centdist
### Keywords: math

### ** Examples

x <- y <- matrix(0, 10, 12)
x[2:3,c(3:6, 8:10)] <- 1
y[c(4:7, 9:10),c(7:9, 11:12)] <- 1

x <- as.im(x)
x <- solutionset(x>0)
y <- as.im(y)
y <- solutionset(y>0)
centdist(x,y)




