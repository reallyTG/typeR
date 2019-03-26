library(rgl)


### Name: grid3d
### Title: Add a grid to a 3D plot
### Aliases: grid3d
### Keywords: dynamic

### ** Examples

x <- 1:10
y <- 1:10
z <- matrix(outer(x - 5, y - 5) + rnorm(100), 10, 10)
open3d()
persp3d(x, y, z, col = "red", alpha = 0.7, aspect = c(1, 1, 0.5))
grid3d(c("x", "y+", "z"))



