library(reliaR)


### Name: ks.moew
### Title: Test of Kolmogorov-Smirnov for the Marshall-Olkin Extended
###   Exponential(MOEW) distribution
### Aliases: ks.moew
### Keywords: htest

### ** Examples

## Load data sets
data(sys2)
## Maximum Likelihood(ML) Estimates of alpha & lambda for the data(sys2)
## alpha.est = 0.3035937,  lambda.est = 279.2177754

ks.moew(sys2, 0.3035937, 279.2177754, alternative = "two.sided", plot = TRUE)



