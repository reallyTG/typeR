library(spatstat)


### Name: as.function.leverage.ppm
### Title: Convert Leverage Object to Function of Coordinates
### Aliases: as.function.leverage.ppm
### Keywords: spatial manip

### ** Examples

  X <- rpoispp(function(x,y) { exp(3+3*x) })
  fit <- ppm(X ~x+y)
  lev <- leverage(fit)
  f <- as.function(lev)
  
  f(0.2, 0.3)  # evaluate at (x,y) coordinates
  y <- f(X)    # evaluate at a point pattern



