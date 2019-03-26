library(NSUM)


### Name: McCarty
### Title: McCarty Dataset
### Aliases: McCarty
### Keywords: datasets

### ** Examples

## load data
data(McCarty)

## simulate from model with barrier effects
sim.bar <- with(McCarty, nsum.simulate(100, known, unknown, N, model="barrier", 
                                       mu, sigma, rho))



