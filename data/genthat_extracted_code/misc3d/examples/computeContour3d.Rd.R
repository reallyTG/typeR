library(misc3d)


### Name: computeContour3d
### Title: Compute Isosurface, a Three Dimension Contour
### Aliases: computeContour3d
### Keywords: hplot

### ** Examples

  x <- seq(-2,2,len=50)
  g <- expand.grid(x = x, y = x, z = x)
  v <- array(g$x^4 + g$y^4 + g$z^4, rep(length(x),3))
  con <- computeContour3d(v, max(v), 1)
  drawScene(makeTriangles(con))



