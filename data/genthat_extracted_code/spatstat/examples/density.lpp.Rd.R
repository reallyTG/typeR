library(spatstat)


### Name: density.lpp
### Title: Kernel Estimate of Intensity on a Linear Network
### Aliases: density.lpp density.splitppx
### Keywords: spatial methods smooth

### ** Examples

  X <- runiflpp(3, simplenet)
  D <- density(X, 0.2, verbose=FALSE)
  plot(D, style="w", main="", adjust=2)
  Dw <- density(X, 0.2, weights=c(1,2,-1), verbose=FALSE)
  De <- density(X, 0.2, kernel="epanechnikov", verbose=FALSE)
  Ded <- density(X, 0.2, kernel="epanechnikov", continuous=FALSE, verbose=FALSE)



