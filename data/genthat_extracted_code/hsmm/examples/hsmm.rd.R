library(hsmm)


### Name: hsmm
### Title: Hidden Semi-Markov Models
### Aliases: hsmm
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

# Executing the EM algorithm:
fit    <- hsmm(sim$obs, od = "norm", rd = "log", 
               pi.par = pipar, tpm.par = tpmpar, 
               od.par = odpar, rd.par = rdpar)

# The log-likelihood:
fit$logl

# Ehe estimated parameters:
fit$para

# For comparison, the estimated parameters seperately together with the true parameter values
# are given below.
# Transition probability matrix:
tpmpar
fit$para$tpm
# Observation distribution:
odpar
fit$para$od
# Runlength distribution:
rdpar
fit$para$rd



