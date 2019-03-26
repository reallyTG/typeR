library(spatstat)


### Name: shift.ppp
### Title: Apply Vector Translation To Point Pattern
### Aliases: shift.ppp
### Keywords: spatial manip

### ** Examples

  data(cells)
  X <- shift(cells, c(2,3))
  ## Not run: 
##D   plot(X)
##D   # no discernible difference except coordinates are different
##D   
## End(Not run)
  plot(cells, pch=16)
  plot(shift(cells, c(0.03,0.03)), add=TRUE)

  shift(cells, origin="mid")



