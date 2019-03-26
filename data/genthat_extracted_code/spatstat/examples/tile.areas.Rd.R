library(spatstat)


### Name: tile.areas
### Title: Compute Areas of Tiles in a Tessellation
### Aliases: tile.areas
### Keywords: spatial manip

### ** Examples

  A <- tess(xgrid=0:2,ygrid=0:2)
  tile.areas(A)
  v <- as.im(function(x,y){factor(round(x^2 + y^2))}, W=owin())
  E <- tess(image=v)
  tile.areas(E)



