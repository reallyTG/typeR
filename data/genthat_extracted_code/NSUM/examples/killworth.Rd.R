library(NSUM)


### Name: killworth
### Title: Calculate Killworth Estimates
### Aliases: killworth

### ** Examples

## load data
data(McCarty)

## simulate from model with barrier effects
sim.bar <- with(McCarty, nsum.simulate(100, known, unknown, N, model="barrier",
                                       mu, sigma, rho))

## estimate unknown population sizes
dat.bar <- sim.bar$y
NK.killworth <- with(McCarty, killworth(dat.bar, known, N))



