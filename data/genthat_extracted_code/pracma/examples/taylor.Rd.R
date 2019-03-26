library(pracma)


### Name: taylor
### Title: Taylor Series Approximation
### Aliases: taylor
### Keywords: math

### ** Examples

taylor(sin, 0, 4)  #=> -0.1666666  0.0000000  1.0000000  0.0000000
taylor(exp, 1, 4)  #=>  0.04166657 0.16666673 0.50000000 1.00000000 1.00000000

f <- function(x) log(1+x)
p <- taylor(f, 0, 4)
p                     # log(1+x) = 0 + x - 1/2 x^2 + 1/3 x^3 - 1/4 x^4 +- ...
                      # [1] -0.250004  0.333334 -0.500000  1.000000  0.000000

## Not run: 
##D x <- seq(-1.0, 1.0, length.out=100)
##D yf <- f(x)
##D yp <- polyval(p, x)
##D plot(x, yf, type = "l", col = "gray", lwd = 3)
##D lines(x, yp, col = "red")
##D grid()
## End(Not run)



