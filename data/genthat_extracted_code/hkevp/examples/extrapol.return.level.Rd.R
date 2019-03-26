library(hkevp)


### Name: extrapol.return.level
### Title: Spatial extrapolation of a return level.
### Aliases: extrapol.return.level

### ** Examples

# Simulation of HKEVP:
sites <- as.matrix(expand.grid(1:3,1:3))
knots <- sites
loc <- sites[,1]*10
scale <- 1
shape <- .2
alpha <- .4
tau <- 1
ysim <- hkevp.rand(10, sites, knots, loc, scale, shape, alpha, tau)

# HKEVP fit:
fit <- hkevp.fit(ysim, sites, niter = 1000)

## Extrapolation of the 100-years return level (may need more iterations and burn-in/nthin):
targets <- as.matrix(expand.grid(1.5:2.5,1.5:2.5))
pred.sample <- extrapol.return.level(100, fit, targets)
pred.mean <- apply(pred.sample, 2, mean)
pred.sd <- apply(pred.sample, 2, sd)
true <- return.level(100, targets[,1]*10, scale, shape)
# cbind(true, pred.mean, pred.sd)






