library(reliaR)


### Name: abic.expo.weibull
### Title: Akaike information criterion (AIC) and Bayesian information
###   criterion (BIC) for Exponentiated Weibull(EW) distribution
### Aliases: abic.expo.weibull
### Keywords: models

### ** Examples

## Load data sets
data(stress)
## Maximum Likelihood(ML) Estimates of alpha & theta for the data(stress)
## Estimates of alpha & theta using 'maxLik' package
## alpha.est =1.026465, theta.est = 7.824943

## Values of AIC, BIC and LogLik for the data(stress)
abic.expo.weibull(stress, 1.026465, 7.824943)



