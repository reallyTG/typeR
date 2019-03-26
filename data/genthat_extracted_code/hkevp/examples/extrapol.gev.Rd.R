library(hkevp)


### Name: extrapol.gev
### Title: Spatial extrapolation of GEV parameters with the HKEVP
### Aliases: extrapol.gev

### ** Examples

# Simulation of HKEVP:
sites <- as.matrix(expand.grid(1:3,1:3))
loc <- sites[,1]*10
scale <- 3
shape <- 0
alpha <- .4
tau <- 1
ysim <- hkevp.rand(10, sites, sites, loc, scale, shape, alpha, tau)

# HKEVP fit:
fit <- hkevp.fit(ysim, sites, niter = 1000)

## Extrapolation:
targets <- matrix(1.5, 1, 2)
gev.targets <- extrapol.gev(fit, targets)

## True vs predicted:
predicted <- sapply(gev.targets, median)
sd.predict <- sapply(gev.targets, sd)
true <- c(targets[,1]*10, scale, shape)
# cbind(true, predicted, sd.predict)





