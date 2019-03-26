library(mirt)


### Name: numerical_deriv
### Title: Compute numerical derivatives
### Aliases: numerical_deriv
### Keywords: derivatives numerical

### ** Examples


## Not run: 
##D f <- function(x) 3*x[1]^3 - 4*x[2]^2
##D par <- c(3,8)
##D 
##D # grad = 9 * x^2 , -8 * y
##D (actual <- c(9 * par[1]^2, -8 * par[2]))
##D numerical_deriv(f, par, type = 'forward')
##D numerical_deriv(f, par, type = 'central')
##D numerical_deriv(f, par, type = 'Richardson') # default
##D 
##D # Hessian = h11 -> 18 * x, h22 -> -8, h12 -> h21 -> 0
##D (actual <- matrix(c(18 * par[1], 0, 0, -8), 2, 2))
##D numerical_deriv(f, par, type = 'forward', gradient = FALSE)
##D numerical_deriv(f, par, type = 'central', gradient = FALSE)
##D numerical_deriv(f, par, type = 'Richardson', gradient = FALSE) # default
##D 
## End(Not run)



