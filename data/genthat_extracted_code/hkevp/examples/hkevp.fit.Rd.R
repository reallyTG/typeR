library(hkevp)


### Name: hkevp.fit
### Title: Fitting procedure of the HKEVP with MCMC algorithm
### Aliases: hkevp.fit

### ** Examples

# Simulation of HKEVP:
set.seed(1)
sites <- as.matrix(expand.grid(1:3,1:3))
loc <- sites[,1]*10
scale <- 3
shape <- 0
alpha <- .4
tau <- 1
ysim <- hkevp.rand(10, sites, sites, loc, scale, shape, alpha, tau)

# HKEVP fit:
fit <- latent.fit(ysim, sites, niter = 1000)






