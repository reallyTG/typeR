library(reliaR)


### Name: ks.logis.exp
### Title: Test of Kolmogorov-Smirnov for the Logistic-Exponential(LE)
###   distribution
### Aliases: ks.logis.exp
### Keywords: htest

### ** Examples

## Load data sets
data(bearings)
## Maximum Likelihood(ML) Estimates of alpha & lambda for the data(bearings)
## Estimates of alpha & lambda using 'maxLik' package
## alpha.est = 2.36754, lambda.est = 0.01059

ks.logis.exp(bearings, 2.36754, 0.01059, alternative = "two.sided", plot = TRUE)



