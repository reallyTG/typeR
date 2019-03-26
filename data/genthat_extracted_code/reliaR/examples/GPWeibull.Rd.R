library(reliaR)


### Name: GPWeibull
### Title: The generalized power Weibull(GPW) distribution
### Aliases: GPWeibull dgp.weibull pgp.weibull qgp.weibull rgp.weibull
### Keywords: distribution

### ** Examples

## Load data sets
data(repairtimes)
## Maximum Likelihood(ML) Estimates of alpha & theta for the data(repairtimes)
## Estimates of alpha & theta using 'maxLik' package
## alpha.est = 1.566093, theta.est = 0.355321

dgp.weibull(repairtimes, 1.566093, 0.355321, log = FALSE)
pgp.weibull(repairtimes, 1.566093, 0.355321, lower.tail = TRUE, log.p = FALSE)
qgp.weibull(0.25, 1.566093, 0.355321, lower.tail=TRUE, log.p = FALSE)
rgp.weibull(30, 1.566093, 0.355321)



