library(bayesDP)


### Name: ppexp
### Title: Compute cdf of the piecewise exponential distribution
### Aliases: ppexp

### ** Examples

# Single vector of hazard rates. Returns a single cdf value.
q    <- 12
x    <- c(0.25,0.3,0.35,0.4)
cuts <- c(0,6,12,18)
pp   <- ppexp(q,x,cuts)

# Matrix of multiple vectors of hazard rates. Returns 10 cdf values.
x  <- matrix(rgamma(4*10, 0.1, 0.1), nrow=10)
pp <- ppexp(q,x,cuts)



