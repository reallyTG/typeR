library(spatstat)


### Name: whichhalfplane
### Title: Test Which Side of Infinite Line a Point Falls On
### Aliases: whichhalfplane
### Keywords: spatial manip

### ** Examples

  L <- infline(p=runif(3), theta=runif(3, max=2*pi))
  X <- runifpoint(4)
  whichhalfplane(L, X)



