library(reliaR)


### Name: ks.burrX
### Title: Test of Kolmogorov-Smirnov for the BurrX distribution
### Aliases: ks.burrX
### Keywords: htest

### ** Examples

## Load data sets
data(bearings)
## Maximum Likelihood(ML) Estimates of alpha & lambda for the data(bearings)
## Estimates of alpha & lambda using 'maxLik' package
## alpha.est = 1.1989515, lambda.est = 0.0130847

ks.burrX(bearings, 1.1989515, 0.0130847, alternative = "two.sided", plot = TRUE)



