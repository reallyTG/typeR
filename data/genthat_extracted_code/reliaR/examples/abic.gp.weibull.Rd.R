library(reliaR)


### Name: abic.gp.weibull
### Title: Akaike information criterion (AIC) and Bayesian information
###   criterion (BIC) for generalized power Weibull(GPW) distribution
### Aliases: abic.gp.weibull
### Keywords: models

### ** Examples

## Load data sets
data(repairtimes)
## Maximum Likelihood(ML) Estimates of alpha & theta for the data(repairtimes)
## Estimates of alpha & theta using 'maxLik' package
## alpha.est = 1.566093, theta.est = 0.355321

## Values of AIC, BIC and LogLik for the data(repairtimes)
abic.gp.weibull(repairtimes, 1.566093, 0.355321)



