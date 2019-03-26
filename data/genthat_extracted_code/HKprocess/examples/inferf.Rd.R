library(HKprocess)


### Name: inferf
### Title: Posterior distribution of the phi parameter of the AR(1)
###   process, using an Accept-Reject algorithm.
### Aliases: inferf
### Keywords: models

### ** Examples

# Posterior distribution of the phi parameter of the AR(1) process for the Nile
# time series.

set.seed(12345)

samp.sim <- inferf(Nile,500)

hist(samp.sim,breaks = 20,main = expression(paste("Histogram of ",phi)),
xlab = expression(phi))



