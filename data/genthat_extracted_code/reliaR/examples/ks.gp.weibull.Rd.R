library(reliaR)


### Name: ks.gp.weibull
### Title: Test of Kolmogorov-Smirnov for the generalized power
###   Weibull(GPW) distribution
### Aliases: ks.gp.weibull
### Keywords: htest

### ** Examples

## Load data sets
data(repairtimes)
## Maximum Likelihood(ML) Estimates of alpha & theta for the data(repairtimes)
## Estimates of alpha & theta using 'maxLik' package
## alpha.est = 1.566093, theta.est = 0.355321

ks.gp.weibull(repairtimes, 1.566093, 0.355321, alternative = "two.sided", plot = TRUE)



