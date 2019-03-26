library(spuRs)


### Name: newtonraphson
### Title: A function of the Newton-Raphson algorithm.
### Aliases: newtonraphson
### Keywords: optimize

### ** Examples

ftn4 <- function(x) {
  # returns function value and its derivative at x
  fx <- log(x) - exp(-x)
  dfx <- 1/x + exp(-x)
  return(c(fx, dfx))
}
newtonraphson(ftn4, 2, 1e-6)



