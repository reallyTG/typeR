library(spatstat)


### Name: stratrand
### Title: Stratified random point pattern
### Aliases: stratrand
### Keywords: spatial datagen

### ** Examples

  w <- unit.square()
  xy <- stratrand(w, 10, 10)
  ## Not run: 
##D   plot(w)
##D   points(xy)
##D   
## End(Not run)

  # polygonal boundary
  bdry <- list(x=c(0.1,0.3,0.7,0.4,0.2),
               y=c(0.1,0.1,0.5,0.7,0.3))
  w <- owin(c(0,1), c(0,1), poly=bdry)
  xy <- stratrand(w, 10, 10, 3)
  ## Not run: 
##D   plot(w)
##D   points(xy)
##D   
## End(Not run)
  # determine which grid points are inside polygon
  ok <- inside.owin(xy$x, xy$y, w)
  ## Not run: 
##D   plot(w)
##D   points(xy$x[ok], xy$y[ok])
##D   
## End(Not run)



