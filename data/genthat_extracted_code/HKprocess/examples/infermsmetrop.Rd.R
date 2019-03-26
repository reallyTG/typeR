library(HKprocess)


### Name: infermsmetrop
### Title: Bayesian inference for mu and sigma^2 for the HKp.
### Aliases: infermsmetrop
### Keywords: models

### ** Examples

# Posterior distributions of the mu and sigma parameters of the HKp for the Nile
# time series.

set.seed(12345)

samp.sim1 <- inferH(Nile,500)

samp.sim2 <- infermsmetrop(samp.sim1,Nile)

hist(samp.sim2[,1],breaks = 20,main = expression(paste("Histogram of ",mu)),
xlab = expression(paste(mu)))

hist(sqrt(samp.sim2[,2]),breaks = 20,
main = expression(paste("Histogram of ",sigma)),xlab = expression(paste(sigma)))



