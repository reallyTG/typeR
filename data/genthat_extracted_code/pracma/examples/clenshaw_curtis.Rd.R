library(pracma)


### Name: clenshaw_curtis
### Title: Clenshaw-Curtis Quadrature Formula
### Aliases: clenshaw_curtis
### Keywords: math

### ** Examples

##  Quadrature with Chebyshev nodes and weights
f <- function(x) sin(x+cos(10*exp(x))/3)
## Not run: ezplot(f, -1, 1, fill = TRUE)
cc <- clenshaw_curtis(f, n = 64)  #=>  0.0325036517151 , true error > 1.3e-10



