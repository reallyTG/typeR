library(reliaR)


### Name: abic.inv.genexp
### Title: Akaike information criterion (AIC) and Bayesian information
###   criterion (BIC) for Inverse Generalized Exponential(IGE) distribution
### Aliases: abic.inv.genexp
### Keywords: models

### ** Examples

## Load data sets
data(repairtimes)
## Maximum Likelihood(ML) Estimates of alpha & lambda for the data(repairtimes)
## Estimates of alpha & lambda using 'maxLik' package
## alpha.est = 1.097807, lambda.est = 1.206889

## Values of AIC, BIC and LogLik for the data(repairtimes)
abic.inv.genexp(repairtimes, 1.097807, 1.206889)



