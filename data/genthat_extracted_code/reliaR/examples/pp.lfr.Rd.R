library(reliaR)


### Name: pp.lfr
### Title: Probability versus Probability (PP) plot for the linear failure
###   rate(LFR) distribution
### Aliases: pp.lfr
### Keywords: hplot

### ** Examples

## Load data sets
data(sys2)
## Maximum Likelihood(ML) Estimates of alpha & beta for the data(sys2)
## Estimates of alpha & beta using 'maxLik' package
## alpha.est = 1.77773e-03,  beta.est = 2.77764e-06

pp.lfr(sys2, 1.777673e-03, 2.777640e-06, main = " ", line = TRUE)



