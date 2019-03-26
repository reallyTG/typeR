library(NSUM)


### Name: nsum.mcmc
### Title: Run MCMC for NSUM Parameters
### Aliases: nsum.mcmc

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

## view posterior distribution of subpopulation sizes for the first subpopulation
hist(mcmc$NK.values[1,])

## view posterior distribution of barrier effect parameters for the first subpopulation
hist(mcmc$rho.values[1,])



