library(spatstat)


### Name: rotate.owin
### Title: Rotate a Window
### Aliases: rotate.owin
### Keywords: spatial math

### ** Examples

  w <- owin(c(0,1),c(0,1))
  v <- rotate(w, pi/3)
  e <- rotate(w, pi/2, centre="midpoint")
  ## Not run: 
##D   plot(v)
##D   
## End(Not run)
  w <- as.mask(letterR)
  v <- rotate(w, pi/5)



