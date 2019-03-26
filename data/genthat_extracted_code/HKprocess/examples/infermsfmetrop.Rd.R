library(HKprocess)


### Name: infermsfmetrop
### Title: Bayesian inference for mu and sigma^2 for the AR(1) process.
### Aliases: infermsfmetrop
### Keywords: models

### ** Examples

# Posterior distribution of the mu and sigma parameters of the AR(1) process for
# the Nile time series.

set.seed(12345)

samp.sim1 <- inferf(Nile,500)

samp.sim2 <- infermsfmetrop(samp.sim1,Nile)

hist(samp.sim2[,1],breaks = 20,main = expression(paste("Histogram of ",mu)),
xlab = expression(paste(mu)))

hist(sqrt(samp.sim2[,2]),breaks = 20,
main = expression(paste("Histogram of ",sigma)),xlab = expression(paste(sigma)))



