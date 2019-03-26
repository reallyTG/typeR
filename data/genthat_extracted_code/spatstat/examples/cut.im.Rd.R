library(spatstat)


### Name: cut.im
### Title: Convert Pixel Image from Numeric to Factor
### Aliases: cut.im
### Keywords: spatial methods

### ** Examples

  # artificial image data
  Z <- setcov(square(1))

  Y <- cut(Z, 3)
  Y <- cut(Z, breaks=seq(0,1,length=5))

  # cut at the quartiles
  # (divides the image into 4 equal areas)
  Y <- cut(Z, quantile(Z))



