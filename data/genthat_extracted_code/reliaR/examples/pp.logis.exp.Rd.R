library(reliaR)


### Name: pp.logis.exp
### Title: Probability versus Probability (PP) plot for the
###   Logistic-Exponential(LE) distribution
### Aliases: pp.logis.exp
### Keywords: hplot

### ** Examples

## Load data sets
data(bearings)
## Maximum Likelihood(ML) Estimates of alpha & lambda for the data(bearings)
## Estimates of alpha & lambda using 'maxLik' package
## alpha.est = 2.36754, lambda.est = 0.01059

pp.logis.exp(bearings, 2.36754, 0.01059, main = " ", line = TRUE)



