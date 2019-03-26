library(spatstat)


### Name: hist.im
### Title: Histogram of Pixel Values in an Image
### Aliases: hist.im
### Keywords: spatial methods

### ** Examples

  X <- as.im(function(x,y) {x^2}, unit.square())
  hist(X)
  hist(cut(X,3))



