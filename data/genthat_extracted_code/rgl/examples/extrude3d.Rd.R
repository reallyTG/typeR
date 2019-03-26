library(rgl)


### Name: extrude3d
### Title: Generate extrusion mesh
### Aliases: extrude3d
### Keywords: graphics

### ** Examples

x <- c(1:10, 10:1)
y <- rev(c(rep(c(0, 2), 5), rep(c(1.5, -0.5), 5)))
plot(x, y, type = "n")
polygon(x, y)
open3d()
shade3d( extrude3d(x, y), col = "red" )



