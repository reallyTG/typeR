library(spuRs)


### Name: fixedpoint
### Title: A function of the fixed point algorithm.
### Aliases: fixedpoint
### Keywords: optimize

### ** Examples

ftn1 <- function(x) return(exp(exp(-x)))
fixedpoint(ftn1, 2, tol = 1e-6)



