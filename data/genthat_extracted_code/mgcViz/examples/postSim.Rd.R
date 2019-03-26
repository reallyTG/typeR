library(mgcViz)


### Name: postSim
### Title: Posterior simulation from a GAM object
### Aliases: postSim

### ** Examples

library(mgcViz)
library(MASS)
b <- gam(accel~s(times, k=20), data=mcycle)

# Simulate list of 10 vectors of responses from posterior, taking into
# account smoothing parameters uncertainty (see ?vcov.gam)
n <- 10
sim <- postSim(o = b, nsim = n, unconditional = TRUE)

# Posterior simulations in grey and data in red
plot(rep(mcycle$times, n), as.vector(t(sim)), col = "grey", 
     ylab = "Acceleration", xlab = "Times")
points(mcycle$times, mcycle$accel, col = 2)

# There is clear disagreement between simulations' and data's 
# conditional variance, which can be solved using flexible GAMLSS model:
b <- gam(list(accel~s(times, k=20), ~s(times)), data=mcycle, family = gaulss)
sim <- postSim(o = b, nsim = n)
plot(rep(mcycle$times, n), as.vector(t(sim)), col = "grey", 
     ylab = "Acceleration", xlab = "Times")
points(mcycle$times, mcycle$accel, col = 2)




