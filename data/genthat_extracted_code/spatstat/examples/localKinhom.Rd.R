library(spatstat)


### Name: localKinhom
### Title: Inhomogeneous Neighbourhood Density Function
### Aliases: localKinhom localLinhom
### Keywords: spatial nonparametric

### ** Examples

  data(ponderosa)
  X <- ponderosa

  # compute all the local L functions
  L <- localLinhom(X)

  # plot all the local L functions against r
  plot(L, main="local L functions for ponderosa", legend=FALSE)

  # plot only the local L function for point number 7
  plot(L, iso007 ~ r)
  
  # compute the values of L(r) for r = 12 metres
  L12 <- localL(X, rvalue=12)



