library(spatstat)


### Name: nearest.raster.point
### Title: Find Pixel Nearest to a Given Point
### Aliases: nearest.raster.point
### Keywords: spatial manip

### ** Examples

  w <- owin(c(0,1), c(0,1), mask=matrix(TRUE, 100,100))  # 100 x 100 grid
  nearest.raster.point(0.5, 0.3, w)
  nearest.raster.point(0.5, 0.3, w, indices=FALSE)



