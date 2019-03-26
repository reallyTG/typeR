library(HKprocess)


### Name: inferfmetrop
### Title: Posterior distribution of the phi parameter of the AR(1)
###   process, using a Metropolis algorithm.
### Aliases: inferfmetrop
### Keywords: models

### ** Examples

# Posterior distribution of the phi parameter of the AR(1) process for the Nile
# time series.

samp.sim <- inferfmetrop(Nile,theta.init = 0.7,burnin = 500,mcmc = 500,thin = 1,
tune = 1,seed = 12345)

hist(samp.sim,breaks = 20,main = expression(paste("Histogram of ",phi)),
xlab = expression(phi))



