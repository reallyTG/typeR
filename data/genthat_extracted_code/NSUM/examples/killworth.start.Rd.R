library(NSUM)


### Name: killworth.start
### Title: Killworth Starting Values for MCMC
### Aliases: killworth.start

### ** Examples

## load data
data(McCarty)

## simulate from model with barrier effects
sim.bar <- with(McCarty, nsum.simulate(100, known, unknown, N, model="barrier",
                                       mu, sigma, rho))

## estimate Killworth starting values
dat.bar <- sim.bar$y
start <- with(McCarty, killworth.start(dat.bar, known, N))

## estimate unknown population size from MCMC
mcmc <- with(McCarty, nsum.mcmc(dat.bar, known, N, model="barrier", iterations=100,
                                burnin=50, NK.start=start$NK.start, d.start=start$d.start, 
                                mu.start=start$mu.start, sigma.start=start$sigma.start))



