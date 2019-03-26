library(pracma)


### Name: fibsearch
### Title: Fibonacci Search
### Aliases: fibsearch
### Keywords: optimize

### ** Examples

f <- function(x) x * cos(0.1*exp(x)) * sin(0.1*pi*exp(x))
fibsearch(f, 0, 4, tol=10^-10)   # $xmin    = 3.24848329403424
optimize(f, c(0,4), tol=10^-10)  # $minimum = 3.24848328971188



