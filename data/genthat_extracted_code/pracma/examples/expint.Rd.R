library(pracma)


### Name: expint
### Title: Exponential and Logarithmic Integral
### Aliases: expint expint_E1 expint_Ei li
### Keywords: specfun

### ** Examples

expint_E1(1:10)
#   0.2193839  0.0489005  0.0130484  0.0037794  0.0011483
#   0.0003601  0.0001155  0.0000377  0.0000124  0.0000042
expint_Ei(1:10)

## Not run: 
##D estimPi <- function(n) round(Re(li(n) - li(2))) # estimated number of primes
##D primesPi <- function(n) length(primes(n))       # true number of primes <= n
##D N <- 1e6
##D (estimPi(N) - primesPi(N)) / estimPi(N)         # deviation is 0.16 percent!
## End(Not run)



