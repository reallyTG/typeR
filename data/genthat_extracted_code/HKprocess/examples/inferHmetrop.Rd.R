library(HKprocess)


### Name: inferHmetrop
### Title: Posterior distribution of the H parameter of the HKp, using a
###   Metropolis algorithm.
### Aliases: inferHmetrop
### Keywords: models

### ** Examples

# Posterior distribution of the H parameter of the HKp for the Nile time series.

samp.sim <- inferHmetrop(Nile,theta.init = 0.7,burnin = 500,mcmc = 500,thin = 1,
tune = 1,seed = 12345)

hist(samp.sim,breaks = 20,main = "Histogram of H",xlab = "H")



