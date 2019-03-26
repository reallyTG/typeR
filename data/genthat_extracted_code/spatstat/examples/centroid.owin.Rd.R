library(spatstat)


### Name: centroid.owin
### Title: Centroid of a window
### Aliases: centroid.owin
### Keywords: spatial math

### ** Examples

  w <- owin(c(0,1),c(0,1))
  centroid.owin(w)
  # returns 0.5, 0.5

  data(demopat)
  w <- Window(demopat)
  # an irregular window
  cent <- centroid.owin(w, as.ppp = TRUE)
  ## Not run: 
##D   plot(cent)
##D   # plot the window and its centroid
##D   
## End(Not run)

  wapprox <- as.mask(w)
  # pixel approximation of window
  ## Not run: 
##D   points(centroid.owin(wapprox))
##D   # should be indistinguishable 
##D   
## End(Not run)
  ## Don't show: 
  centroid.owin(w)
  centroid.owin(wapprox)
  
## End(Don't show)	



