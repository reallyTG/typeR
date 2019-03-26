library(NSUM)


### Name: NSUM-package
### Title: NSUM: Network Scale Up Method
### Aliases: NSUM-package NSUM
### Keywords: package

### ** Examples

## load data
data(McCarty)

## simulate from model with barrier effects
sim.bar <- with(McCarty, nsum.simulate(100, known, unknown, N, model="barrier", 
                                       mu, sigma, rho))

## estimate unknown population size
dat.bar <- sim.bar$y
mcmc <- with(McCarty, nsum.mcmc(dat.bar, known, N, model="barrier", iterations=100,
                                burnin=50))

## view posterior distribution
hist(mcmc$NK.values[1,])



