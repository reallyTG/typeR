library(NSUM)


### Name: nsum.simulate
### Title: Simulate NSUM Data
### Aliases: nsum.simulate

### ** Examples

## load data
data(McCarty)

## simulate from model with barrier effects
sim.bar <- with(McCarty, nsum.simulate(100, known, unknown, N, model="barrier", 
                                       mu, sigma, rho))

## simulate from model with both barrier effects and transmission biases
sim.comb <- with(McCarty, nsum.simulate(100, known, unknown, N, model="combined",
                                        mu, sigma, rho, tauK))

## extract data for use in MCMC
dat.bar <- sim.bar$y

## view degree distribution
hist(sim.bar$d)



