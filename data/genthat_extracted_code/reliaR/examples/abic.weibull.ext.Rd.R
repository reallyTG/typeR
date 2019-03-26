library(reliaR)


### Name: abic.weibull.ext
### Title: Akaike information criterion (AIC) and Bayesian information
###   criterion (BIC) for Weibull Extension(WE) distribution
### Aliases: abic.weibull.ext
### Keywords: models

### ** Examples

## Load data sets
data(sys2)
## Maximum Likelihood(ML) Estimates of alpha & beta for the data(sys2)
## Estimates of alpha & beta using 'maxLik' package
## alpha.est = 0.00019114, beta.est = 0.14696242

## Values of AIC, BIC and LogLik for the data(sys2)
abic.weibull.ext(sys2, 0.00019114, 0.14696242)



