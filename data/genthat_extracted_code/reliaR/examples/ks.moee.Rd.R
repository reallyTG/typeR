library(reliaR)


### Name: ks.moee
### Title: Test of Kolmogorov-Smirnov for the Marshall-Olkin Extended
###   Exponential(MOEE) distribution
### Aliases: ks.moee
### Keywords: htest

### ** Examples

## Load dataset
data(stress)
## Estimates of alpha & lambda using 'maxLik' package
## alpha.est = 75.67982, lambda.est = 1.67576

ks.moee(stress, 75.67982, 1.67576, alternative = "two.sided", plot = TRUE)



