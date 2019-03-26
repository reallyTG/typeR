library(spuRs)


### Name: bisection
### Title: A function of the bisection algorithm.
### Aliases: bisection
### Keywords: optimize

### ** Examples

ftn5 <- function(x) return(log(x)-exp(-x))
bisection(ftn5, 1, 2, tol = 1e-6)



