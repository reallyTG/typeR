library(Ecohydmod)


### Name: swb_f
### Title: Soil water balance
### Aliases: swb_f

### ** Examples

rain = 10 * RainPoisson(ndays = 365, lambda = 0.05, alpha = 0.60)
swb_f(R = rain, Rstar = 3, Emax = 5, Ew = 0.5, Ks = 2000, b = 4.38, Zr = 400,
n = 0.5, sh = 0.01, sw = 0.10, sstar = 0.25, s0 = 0.10, nsteps = 48)



