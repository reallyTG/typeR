library(spatstat)


### Name: scaletointerval
### Title: Rescale Data to Lie Between Specified Limits
### Aliases: scaletointerval scaletointerval.default scaletointerval.im
### Keywords: spatial methods univar

### ** Examples

  X <- as.im(function(x,y) {x+y+3}, unit.square())
  summary(X)
  Y <- scaletointerval(X)
  summary(Y)



