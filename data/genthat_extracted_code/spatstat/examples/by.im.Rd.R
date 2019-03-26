library(spatstat)


### Name: by.im
### Title: Apply Function to Image Broken Down by Factor
### Aliases: by.im
### Keywords: spatial methods manip

### ** Examples

  W <- square(1)
  X <- as.im(function(x,y){sqrt(x^2+y^2)}, W)
  Y <- dirichlet(runifpoint(12, W))
  # mean pixel value in each subset
  unlist(by(X, Y, mean))
  # trimmed mean
  unlist(by(X, Y, mean, trim=0.05))



