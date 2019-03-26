library(lmom)


### Name: cdfln3
### Title: Three-parameter lognormal distribution
### Aliases: cdfln3 qualn3
### Keywords: distribution

### ** Examples

# Random sample from three-parameter lognormal distribution
# with parameters zeta=0, mu=1, sigma=0.5.
qualn3(runif(100), c(0,1,0.5))

## Functions for the three-parameter lognormal distribution can
## also be used with the two-parameter lognormal distribution
# Generate a random sample from a standard lognormal distribution
xx <- qualn3(runif(50))
# Fit 2-parameter LN distribution
pelln3(samlmu(xx), bound=0)
# Fit 2-parameter LN distribution "in log space",
# i.e. fit normal distribution to log-transformed data
pelnor(samlmu(log(xx)))



