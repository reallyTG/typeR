library(HKprocess)


### Name: inferH
### Title: Posterior distribution of the H parameter of the HKp using an
###   Accept-Reject algorithm.
### Aliases: inferH
### Keywords: models

### ** Examples

# Posterior distribution of the H parameter of the HKp for the Nile time series.

set.seed(12345)

samp.sim <- inferH(Nile,500)

hist(samp.sim,breaks = 20,main = "Histogram of H",xlab = "H")



