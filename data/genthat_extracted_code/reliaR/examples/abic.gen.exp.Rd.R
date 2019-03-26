library(reliaR)


### Name: abic.gen.exp
### Title: Akaike information criterion (AIC) and Bayesian information
###   criterion (BIC) for a sample from Generalized Exponential
###   distribution
### Aliases: abic.gen.exp
### Keywords: models

### ** Examples

## Load data set
data(bearings)
## Estimates of alpha & lambda using 'maxLik' package
## alpha.est = 5.28321139, lambda.est = 0.03229609
abic.gen.exp(bearings, 5.28321139, 0.03229609)



