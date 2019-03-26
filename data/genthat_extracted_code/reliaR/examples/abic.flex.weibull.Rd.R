library(reliaR)


### Name: abic.flex.weibull
### Title: Akaike information criterion (AIC) and Bayesian information
###   criterion (BIC) for flexible Weibull(FW) distribution
### Aliases: abic.flex.weibull
### Keywords: models

### ** Examples

## Load data sets
data(repairtimes)
## Maximum Likelihood(ML) Estimates of alpha & beta for the data(repairtimes)
## Estimates of alpha & beta using 'maxLik' package
## alpha.est = 0.07077507, beta.est = 1.13181535

## Values of AIC, BIC and LogLik for the data(repairtimes)
abic.flex.weibull(repairtimes, 0.07077507, 1.13181535)



