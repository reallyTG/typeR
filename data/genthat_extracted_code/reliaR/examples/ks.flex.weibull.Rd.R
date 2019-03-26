library(reliaR)


### Name: ks.flex.weibull
### Title: Test of Kolmogorov-Smirnov for the flexible Weibull(FW)
###   distribution
### Aliases: ks.flex.weibull
### Keywords: htest

### ** Examples

## Load data sets
data(repairtimes)
## Maximum Likelihood(ML) Estimates of alpha & beta for the data(repairtimes)
## Estimates of alpha & beta using 'maxLik' package
## alpha.est = 0.07077507, beta.est = 1.13181535

ks.flex.weibull(repairtimes, 0.07077507, 1.13181535, 
    alternative = "two.sided", plot = TRUE)



