library(reliaR)


### Name: FlexWeibullsurvival
### Title: Survival related functions for the flexible Weibull(FW)
###   distribution
### Aliases: FlexWeibullsurvival crf.flex.weibull hflex.weibull
###   hra.flex.weibull sflex.weibull
### Keywords: survival

### ** Examples

## load data set
data(repairtimes)
## Maximum Likelihood(ML) Estimates of alpha & beta for the data(repairtimes)
## Estimates of alpha & beta using 'maxLik' package
## alpha.est = 0.07077507, beta.est = 1.13181535

## Reliability indicators for data(repairtimes):

## Reliability function
sflex.weibull(repairtimes, 0.07077507, 1.13181535)

## Hazard function
hflex.weibull(repairtimes, 0.07077507, 1.13181535)

## hazard rate average(hra)
hra.flex.weibull(repairtimes, 0.07077507, 1.13181535)

## Conditional reliability function (age component=0)
crf.flex.weibull(repairtimes, 0.00, 0.07077507, 1.13181535)

## Conditional reliability function (age component=3.0)
crf.flex.weibull(repairtimes, 3.0, 0.07077507, 1.13181535)



