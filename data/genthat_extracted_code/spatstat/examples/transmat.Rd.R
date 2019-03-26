library(spatstat)


### Name: transmat
### Title: Convert Pixel Array Between Different Conventions
### Aliases: transmat
### Keywords: spatial hplot manip

### ** Examples

  opa <- par(mfrow=c(1,2))
  # image in spatstat format
  Z <- bei.extra$elev
  plot(Z, main="plot.im", ribbon=FALSE)
  m <- as.matrix(Z)
  # convert matrix to format suitable for display by image.default
  Y <- transmat(m, from="spatstat", to="Cartesian")
  image(Y, asp=0.5, main="image.default", axes=FALSE)
  par(opa)



