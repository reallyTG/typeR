library(spatstat)


### Name: colourmap
### Title: Colour Lookup Tables
### Aliases: colourmap
### Keywords: spatial color

### ** Examples

  # colour map for real numbers, using breakpoints
  cr <- colourmap(c("red", "blue", "green"), breaks=c(0,5,10,15))
  cr
  cr(3.2)
  cr(c(3,5,7))
  # a large colour map
  co <- colourmap(rainbow(100), range=c(-1,1))
  co(0.2)
  # colour map for discrete set of values
  ct <- colourmap(c("red", "green"), inputs=c(FALSE, TRUE))
  ct(TRUE)



