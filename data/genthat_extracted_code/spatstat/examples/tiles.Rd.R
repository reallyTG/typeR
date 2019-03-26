library(spatstat)


### Name: tiles
### Title: Extract List of Tiles in a Tessellation
### Aliases: tiles
### Keywords: spatial manip

### ** Examples

  A <- tess(xgrid=0:2,ygrid=0:2)
  tiles(A)
  v <- as.im(function(x,y){factor(round(x^2 + y^2))}, W=owin())
  E <- tess(image=v)
  tiles(E)



