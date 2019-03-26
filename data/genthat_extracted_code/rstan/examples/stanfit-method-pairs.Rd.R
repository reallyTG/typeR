library(rstan)


### Name: pairs.stanfit
### Title: Create a matrix of output plots from a 'stanfit' object
### Aliases: pairs.stanfit

### ** Examples

example(read_stan_csv)
pairs(fit, pars = c("mu", "sigma", "alpha", "lp__"), log = TRUE, las = 1)
# sigma and alpha will have logarithmic axes



