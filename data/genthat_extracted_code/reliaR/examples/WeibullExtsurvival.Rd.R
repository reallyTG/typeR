library(reliaR)


### Name: WeibullExtsurvival
### Title: Survival related functions for the Weibull Extension(WE)
###   distribution
### Aliases: WeibullExtsurvival crf.weibull.ext hweibull.ext
###   hra.weibull.ext sweibull.ext
### Keywords: survival

### ** Examples

## load data set
data(sys2)
## Maximum Likelihood(ML) Estimates of alpha & beta for the data(sys2)
## Estimates of alpha & beta using 'maxLik' package
## alpha.est = 0.00019114, beta.est = 0.14696242

## Reliability indicators for data(sys2):

## Reliability function
sweibull.ext(sys2, 0.00019114, 0.14696242)

## Hazard function
hweibull.ext(sys2, 0.00019114, 0.14696242)

## hazard rate average(hra)
hra.weibull.ext(sys2, 0.00019114, 0.14696242)

## Conditional reliability function (age component=0)
crf.weibull.ext(sys2, 0.00, 0.00019114, 0.14696242)

## Conditional reliability function (age component=3.0)
crf.weibull.ext(sys2, 3.0, 0.00019114, 0.14696242)



