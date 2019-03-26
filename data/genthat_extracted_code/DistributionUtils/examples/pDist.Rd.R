library(DistributionUtils)


### Name: pDist
### Title: Distribution and Quantile Functions for Unimodal Distributions
### Aliases: pDist qDist
### Keywords: distribution univar

### ** Examples

pDist("norm", q = 2, mean = 1, sd = 1)
pDist("t", q = 0.5, df = 4)
require(GeneralizedHyperbolic)
pDist("ghyp", q = 0.1)
require(SkewHyperbolic)
qDist("skewhyp", p = 0.4, param = c(0, 1, 0, 10))
qDist("t", p = 0.2, df = 4)



