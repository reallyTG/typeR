library(spatstat)


### Name: mean.im
### Title: Mean and Median of Pixel Values in an Image
### Aliases: mean.im median.im
### Keywords: spatial methods univar

### ** Examples

  X <- as.im(function(x,y) {x^2}, unit.square())
  mean(X)
  median(X)
  mean(X, trim=0.05)



