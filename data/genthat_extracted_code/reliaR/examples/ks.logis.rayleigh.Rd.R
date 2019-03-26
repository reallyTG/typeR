library(reliaR)


### Name: ks.logis.rayleigh
### Title: Test of Kolmogorov-Smirnov for the Logistic-Rayleigh(LR)
###   distribution
### Aliases: ks.logis.rayleigh
### Keywords: htest

### ** Examples

## Load data sets
data(stress)
## Maximum Likelihood(ML) Estimates of alpha & lambda for the data(stress)
## Estimates of alpha & lambda using 'maxLik' package
## alpha.est = 1.4779388, lambda.est = 0.2141343

ks.logis.rayleigh(stress, 1.4779388, 0.2141343, 
    alternative = "two.sided", plot = TRUE)



