library(rgl)


### Name: aspect3d
### Title: Set the aspect ratios of the current plot
### Aliases: aspect3d
### Keywords: dynamic

### ** Examples

  x <- rnorm(100)
  y <- rnorm(100)*2
  z <- rnorm(100)*3
  
  open3d()
  plot3d(x, y, z)
  aspect3d(1, 1, 0.5)
  highlevel()  # To trigger display
  open3d()
  plot3d(x, y, z)
  aspect3d("iso")
  highlevel()



