library(spatstat)


### Name: pairs.im
### Title: Scatterplot Matrix for Pixel Images
### Aliases: pairs.im
### Keywords: spatial hplot

### ** Examples

  X <- density(rpoispp(30))
  Y <- density(rpoispp(40))
  Z <- density(rpoispp(30))
  p <- pairs(X,Y,Z)
  p
  plot(p)



