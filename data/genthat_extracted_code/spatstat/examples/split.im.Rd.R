library(spatstat)


### Name: split.im
### Title: Divide Image Into Sub-images
### Aliases: split.im
### Keywords: spatial methods manip

### ** Examples

  W <- square(1)
  X <- as.im(function(x,y){sqrt(x^2+y^2)}, W)
  Y <- dirichlet(runifpoint(12, W))
  plot(split(X,Y))



