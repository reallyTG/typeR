library(reliaR)


### Name: ExpoWeibullsurvival
### Title: Survival related functions for the Exponentiated Weibull(EW)
###   distribution
### Aliases: ExpoWeibullsurvival crf.expo.weibull hexpo.weibull
###   hra.expo.weibull sexpo.weibull
### Keywords: survival

### ** Examples

## load data set
data(stress)
## Maximum Likelihood(ML) Estimates of alpha & theta for the data(stress)
## Estimates of alpha & theta using 'maxLik' package
## alpha.est =1.026465, theta.est = 7.824943

## Reliability indicators for data(stress):

## Reliability function
sexpo.weibull(stress, 1.026465, 7.824943)

## Hazard function
hexpo.weibull(stress, 1.026465, 7.824943)

## hazard rate average(hra)
hra.expo.weibull(stress, 1.026465, 7.824943)

## Conditional reliability function (age component=0)
crf.expo.weibull(stress, 0.00, 1.026465, 7.824943)

## Conditional reliability function (age component=3.0)
crf.expo.weibull(stress, 3.0, 1.026465, 7.824943)



