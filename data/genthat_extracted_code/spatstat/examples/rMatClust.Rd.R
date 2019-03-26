library(spatstat)


### Name: rMatClust
### Title: Simulate Matern Cluster Process
### Aliases: rMatClust
### Keywords: spatial datagen

### ** Examples

 # homogeneous
 X <- rMatClust(10, 0.05, 4)
 # inhomogeneous
 ff <- function(x,y){ 4 * exp(2 * abs(x) - 1) }
 Z <- as.im(ff, owin())
 Y <- rMatClust(10, 0.05, Z)
 YY <- rMatClust(ff, 0.05, 3)



