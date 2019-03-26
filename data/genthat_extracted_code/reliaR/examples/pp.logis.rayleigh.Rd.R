library(reliaR)


### Name: pp.logis.rayleigh
### Title: Probability versus Probability (PP) plot for the
###   Logistic-Rayleigh(LR) distribution
### Aliases: pp.logis.rayleigh
### Keywords: hplot

### ** Examples

## Load data sets
data(stress)
## Maximum Likelihood(ML) Estimates of alpha & lambda for the data(stress)
## Estimates of alpha & lambda using 'maxLik' package
## alpha.est = 1.4779388, lambda.est = 0.2141343

pp.logis.rayleigh(stress, 1.4779388, 0.2141343, main = " ", line = TRUE)



