library(hkevp)


### Name: hkevp.predict
### Title: Predictive distribution of the max-stable process at target
###   positions.
### Aliases: hkevp.predict

### ** Examples

# Simulation of HKEVP:
sites <- as.matrix(expand.grid(1:3,1:3))
targets <- as.matrix(expand.grid(1.5:2.5,1.5:2.5))
all.pos <- rbind(sites, targets)
knots <- sites
loc <- all.pos[,1]*10
scale <- 3
shape <- 0
alpha <- .4
tau <- 1
ysim <- hkevp.rand(10, all.pos, knots, loc, scale, shape, alpha, tau)
yobs <- ysim[,1:9]

# HKEVP fit (omitting first site, used as target):
fit <- hkevp.fit(yobs, sites, niter = 1000)

# Extrapolation:
ypred <- hkevp.predict(fit, targets, predict.type = "kriging")

# Plot of the density and the true value for 4 first realizations:
# par(mfrow = c(2, 2))
# plot(density(ypred[1,1,]), main = "Target 1 / Year 1")
# abline(v = ysim[1,10], col = 2, lwd = 2)
# plot(density(ypred[2,1,]), main = "Target 1 / Year 2")
# abline(v = ysim[2,10], col = 2, lwd = 2)
# plot(density(ypred[1,2,]), main = "Target 2 / Year 1")
# abline(v = ysim[1,11], col = 2, lwd = 2)
# plot(density(ypred[2,2,]), main = "Target 2 / Year 2")
# abline(v = ysim[2,11], col = 2, lwd = 2)







