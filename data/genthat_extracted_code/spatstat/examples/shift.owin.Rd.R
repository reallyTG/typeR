library(spatstat)


### Name: shift.owin
### Title: Apply Vector Translation To Window
### Aliases: shift.owin
### Keywords: spatial manip

### ** Examples

  W <- owin(c(0,1),c(0,1))
  X <- shift(W, c(2,3))
  ## Not run: 
##D   plot(W)
##D   # no discernible difference except coordinates are different
##D   
## End(Not run)
  shift(W, origin="mid")



