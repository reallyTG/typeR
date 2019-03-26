library(spatstat)


### Name: print.owin
### Title: Print Brief Details of a Spatial Window
### Aliases: print.owin
### Keywords: spatial print

### ** Examples

  owin()  # the unit square

  data(demopat)
  W <- Window(demopat)
  W                    # just says it is polygonal
  as.mask(W)           # just says it is a binary image 




