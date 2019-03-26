library(numDeriv)


### Name: jacobian
### Title: Gradient of a Vector Valued Function
### Aliases: jacobian jacobian.default
### Keywords: multivariate

### ** Examples

   func2 <- function(x) c(sin(x), cos(x))
   x <- (0:1)*2*pi
   jacobian(func2, x)
   jacobian(func2, x, "complex")



