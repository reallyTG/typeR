library(spatstat)


### Name: eval.im
### Title: Evaluate Expression Involving Pixel Images
### Aliases: eval.im
### Keywords: spatial manip programming

### ** Examples

  # test images
  X <- as.im(function(x,y) { x^2 - y^2 }, unit.square())
  Y <- as.im(function(x,y) { 3 * x + y }, unit.square())

  eval.im(X + 3)
  eval.im(X - Y)
  eval.im(abs(X - Y))
  Z <- eval.im(sin(X * pi) + Y)

  ## Use of 'envir'
  W <- eval.im(sin(U), list(U=density(cells)))



