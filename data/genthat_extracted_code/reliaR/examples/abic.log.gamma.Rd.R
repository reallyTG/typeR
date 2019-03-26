library(reliaR)


### Name: abic.log.gamma
### Title: Akaike information criterion (AIC) and Bayesian information
###   criterion (BIC) for log-gamma(LG) distribution
### Aliases: abic.log.gamma
### Keywords: models

### ** Examples

## Load data sets
data(conductors)
## Maximum Likelihood(ML) Estimates of alpha & lambda for the data(conductors)
## Estimates of alpha & lambda using 'maxLik' package
## alpha.est = 0.0088741, lambda.est = 0.6059935

## Values of AIC, BIC and LogLik for the data(conductors)
abic.log.gamma(conductors, 0.0088741, 0.6059935)



