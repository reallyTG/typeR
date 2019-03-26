library(spatstat)


### Name: integral.im
### Title: Integral of a Pixel Image
### Aliases: integral integral.im
### Keywords: spatial math

### ** Examples

   # approximate integral of f(x,y) dx dy
   f <- function(x,y){3*x^2 + 2*y}
   Z <- as.im(f, square(1))
   integral.im(Z)
   # correct answer is 2

   D <- density(cells)
   integral.im(D)
   # should be approximately equal to number of points = 42

   # integrate over the subset [0.1,0.9] x [0.2,0.8]
   W <- owin(c(0.1,0.9), c(0.2,0.8))
   integral.im(D, W)



