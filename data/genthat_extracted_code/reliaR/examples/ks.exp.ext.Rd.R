library(reliaR)


### Name: ks.exp.ext
### Title: Test of Kolmogorov-Smirnov for the Exponential Extension(EE)
###   distribution
### Aliases: ks.exp.ext
### Keywords: htest

### ** Examples

## Load data sets
data(sys2)
## Maximum Likelihood(ML) Estimates of alpha & lambda for the data(sys2)
## Estimates of alpha & lambda using 'maxLik' package
## alpha.est = 1.0126e+01, lambda.est = 1.5848e-04

ks.exp.ext(sys2, 1.0126e+01, 1.5848e-04, alternative = "two.sided", plot = TRUE)



