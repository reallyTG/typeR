library(hsmm)


### Name: hsmm.smooth
### Title: Hidden Semi-Markov Models
### Aliases: hsmm.smooth
### Keywords: ts

### ** Examples

# Simulating observations: 
# (see hsmm.sim for details)
pipar  <- rep(1/3, 3)
tpmpar <- matrix(c(0, 0.5, 0.5,
                   0.7, 0, 0.3,
                   0.8, 0.2, 0), 3, byrow = TRUE)
rdpar  <- list(p = c(0.98, 0.98, 0.99))
odpar  <- list(mean = c(-1.5, 0, 1.5), var = c(0.5, 0.6, 0.8))
sim    <- hsmm.sim(n = 2000, od = "norm", rd = "log", 
                   pi.par = pipar, tpm.par = tpmpar, 
                   rd.par = rdpar, od.par = odpar, seed = 3539)

# Computation of the smoothing probabilities:
fit.sm <- hsmm.smooth(sim$obs, od = "norm", rd = "log", 
                      pi.par = pipar, tpm.par = tpmpar, 
                      od.par = odpar, rd.par = rdpar)

# The first 15 smoothing probabilities:
round(fit.sm$sm[, 1:15], 2)

# The first 15 values of the resulting path:
fit.sm$path[1:15]

# For comparison, the real/simulated path (first 15 values):
sim$path[1:15]



