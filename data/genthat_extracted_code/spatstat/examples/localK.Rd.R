library(spatstat)


### Name: localK
### Title: Neighbourhood density function
### Aliases: localK localL
### Keywords: spatial nonparametric

### ** Examples

  data(ponderosa)
  X <- ponderosa

  # compute all the local L functions
  L <- localL(X)

  # plot all the local L functions against r
  plot(L, main="local L functions for ponderosa", legend=FALSE)

  # plot only the local L function for point number 7
  plot(L, iso007 ~ r)
  
  # compute the values of L(r) for r = 12 metres
  L12 <- localL(X, rvalue=12)

  # Spatially interpolate the values of L12
  # Compare Figure 5(b) of Getis and Franklin (1987)
  X12 <- X %mark% L12
  Z <- Smooth(X12, sigma=5, dimyx=128)

  plot(Z, col=topo.colors(128), main="smoothed neighbourhood density")
  contour(Z, add=TRUE)
  points(X, pch=16, cex=0.5)



