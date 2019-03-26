library(spatstat)


### Name: gridcentres
### Title: Rectangular grid of points
### Aliases: gridcentres gridcenters
### Keywords: spatial datagen

### ** Examples

  w <- unit.square()
  xy <- gridcentres(w, 10,15)
  ## Not run: 
##D   plot(w)
##D   points(xy)
##D   
## End(Not run)

  bdry <- list(x=c(0.1,0.3,0.7,0.4,0.2),
               y=c(0.1,0.1,0.5,0.7,0.3))
  w <- owin(c(0,1), c(0,1), poly=bdry)
  xy <- gridcentres(w, 30, 30)
  ok <- inside.owin(xy$x, xy$y, w)
  ## Not run: 
##D   plot(w)
##D   points(xy$x[ok], xy$y[ok])
##D   
## End(Not run)



