library(rgl)


### Name: plot3d
### Title: 3D Scatterplot
### Aliases: plot3d plot3d.default plot3d.mesh3d decorate3d
### Keywords: dynamic

### ** Examples

  open3d()
  x <- sort(rnorm(1000))
  y <- rnorm(1000)
  z <- rnorm(1000) + atan2(x, y)
  plot3d(x, y, z, col = rainbow(1000))



