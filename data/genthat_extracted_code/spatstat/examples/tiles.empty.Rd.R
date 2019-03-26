library(spatstat)


### Name: tiles.empty
### Title: Check For Empty Tiles in a Tessellation
### Aliases: tiles.empty
### Keywords: spatial manip

### ** Examples

  A <- tess(xgrid=0:2,ygrid=0:2)
  tiles.empty(A)
  v <- as.im(function(x,y){factor(round(x^2 + y^2))}, W=owin())
  E <- tess(image=v)
  tiles.empty(E)



