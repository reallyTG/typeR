library(pracma)


### Name: quadl
### Title: Adaptive Lobatto Quadrature
### Aliases: quadl
### Keywords: math

### ** Examples

# options(digits=15)
f <- function(x) x * cos(0.1*exp(x)) * sin(0.1*pi*exp(x))
quadl(f, 0, 4)              # 1.2821290743501
integrate(f, 0, 4)
# 1.28212907435010 with absolute error < 4.1e-06

## Not run: 
##D xx <- seq(0, 4, length.out = 200)
##D yy <- f(xx)
##D plot(xx, yy, type = 'l')
##D grid()
## End(Not run)



