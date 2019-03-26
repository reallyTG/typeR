library(reliaR)


### Name: ks.lfr
### Title: Test of Kolmogorov-Smirnov for the linear failure rate(LFR)
###   distribution
### Aliases: ks.lfr
### Keywords: htest

### ** Examples

## Load data sets
data(sys2)
## Maximum Likelihood(ML) Estimates of alpha & beta for the data(sys2)
## Estimates of alpha & beta using 'maxLik' package
## alpha.est = 1.77773e-03,  beta.est = 2.77764e-06

ks.lfr(sys2, 1.777673e-03, 2.777640e-06, alternative = "two.sided", plot = TRUE)



