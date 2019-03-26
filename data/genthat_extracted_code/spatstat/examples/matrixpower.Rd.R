library(spatstat)


### Name: matrixpower
### Title: Power of a Matrix
### Aliases: matrixpower matrixsqrt matrixinvsqrt
### Keywords: algebra array

### ** Examples

  x <- matrix(c(10,2,2,1), 2, 2)
  y <- matrixsqrt(x)
  y
  y %*% y 
  z <- matrixinvsqrt(x)
  z %*% y
  matrixpower(x, 0.1)



