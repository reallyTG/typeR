library(reliaR)


### Name: ks.gen.exp
### Title: Test of Kolmogorov-Smirnov for the Generalized Exponential(GE)
###   distribution
### Aliases: ks.gen.exp
### Keywords: htest

### ** Examples

## Load data sets
data(bearings)
## Estimates of alpha & lambda using 'maxLik' package
## alpha.est = 5.28321139, lambda.est = 0.03229609
ks.gen.exp(bearings, 5.28321139, 0.03229609, alternative = "two.sided", plot = TRUE)



