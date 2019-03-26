library(spatstat)


### Name: marktable
### Title: Tabulate Marks in Neighbourhood of Every Point in a Point
###   Pattern
### Aliases: marktable
### Keywords: spatial programming

### ** Examples

  head(marktable(amacrine, 0.1))
  head(marktable(amacrine, 0.1, exclude=FALSE))
  marktable(amacrine, N=1, collapse=TRUE)



