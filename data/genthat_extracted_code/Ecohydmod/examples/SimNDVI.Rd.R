library(Ecohydmod)


### Name: SimNDVI
### Title: NDVI simulation
### Aliases: SimNDVI

### ** Examples

rain = 10 * RainPoisson(ndays = 365, lambda = 0.05, alpha = 0.60)
s = swb_f(R = rain, Rstar = 3, Emax = 5, Ew = 0.5, Ks = 2000, b = 4.38, Zr = 400,
n = 0.5, sh = 0.01, sw = 0.10, sstar = 0.25, s0 = 0.10, nsteps = 48, gr = T)[,3]
NDVI = SimNDVI(s, sw = 0.10, sstar = 0.35, kA = 0.064, kR = 0.011,
Nmax = 0.93, Nmin = 0.26, N0 = 0.5)



