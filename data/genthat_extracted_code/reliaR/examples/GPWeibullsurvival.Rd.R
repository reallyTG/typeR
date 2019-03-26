library(reliaR)


### Name: GPWeibullsurvival
### Title: Survival related functions for the generalized power
###   Weibull(GPW) distribution
### Aliases: GPWeibullsurvival crf.gp.weibull hgp.weibull hra.gp.weibull
###   sgp.weibull
### Keywords: survival

### ** Examples

## load data set
data(repairtimes)
## Maximum Likelihood(ML) Estimates of alpha & theta for the data(repairtimes)
## Estimates of alpha & theta using 'maxLik' package
## alpha.est = 1.566093, theta.est = 0.355321

## Reliability indicators for data(repairtimes):

## Reliability function
sgp.weibull(repairtimes, 1.566093, 0.355321)

## Hazard function
hgp.weibull(repairtimes, 1.566093, 0.355321)

## hazard rate average(hra)
hra.gp.weibull(repairtimes, 1.566093, 0.355321)

## Conditional reliability function (age component=0)
crf.gp.weibull(repairtimes, 0.00, 1.566093, 0.355321)

## Conditional reliability function (age component=3.0)
crf.gp.weibull(repairtimes, 3.0, 1.566093, 0.355321)



