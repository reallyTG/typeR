library(spatstat)


### Name: colouroutputs
### Title: Extract or Assign Colour Values in a Colour Map
### Aliases: colouroutputs colouroutputs<-
### Keywords: spatial color

### ** Examples

  m <- colourmap(rainbow(5), range=c(0,1))
  m
  # reverse order of colours
  colouroutputs(m) <- rev(colouroutputs(m))
  m



