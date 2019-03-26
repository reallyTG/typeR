library(hkevp)


### Name: mcmc.fun
### Title: Point estimates of HKEVP fit
### Aliases: mcmc.fun

### ** Examples

# Simulation of HKEVP:
sites <- as.matrix(expand.grid(1:3,1:3))
knots <- sites
loc <- sites[,1]*10
scale <- 3
shape <- .2
alpha <- .4
tau <- 1
ysim <- hkevp.rand(10, sites, knots, loc, scale, shape, alpha, tau)

# HKEVP fit:
fit <- hkevp.fit(ysim, sites, niter = 1000)

# Posterior median and standard deviation:
# mcmc.fun(fit, median)
# mcmc.fun(fit, sd)






