library(reliaR)


### Name: ks.expo.weibull
### Title: Test of Kolmogorov-Smirnov for the Exponentiated Weibull(EW)
###   distribution
### Aliases: ks.expo.weibull
### Keywords: htest

### ** Examples

## Load data sets
data(stress)
## Maximum Likelihood(ML) Estimates of alpha & theta for the data(stress)
## Estimates of alpha & theta using 'maxLik' package
## alpha.est =1.026465, theta.est = 7.824943

ks.expo.weibull(stress, 1.026465, 7.824943, alternative = "two.sided", plot = TRUE)



