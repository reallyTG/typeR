library(spatstat)


### Name: raster.x
### Title: Cartesian Coordinates for a Pixel Raster
### Aliases: raster.x raster.y raster.xy
### Keywords: spatial manip

### ** Examples

  u <- owin(c(-1,1),c(-1,1)) # square of side 2
  w <- as.mask(u, eps=0.01) # 200 x 200 grid
  X <- raster.x(w)
  Y <- raster.y(w)
  disc <- owin(c(-1,1), c(-1,1), mask=(X^2 + Y^2 <= 1))
  ## Not run: plot(disc)
  # approximation to the unit disc



