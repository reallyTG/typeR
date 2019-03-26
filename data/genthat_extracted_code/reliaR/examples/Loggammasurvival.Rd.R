library(reliaR)


### Name: Loggammasurvival
### Title: Survival related functions for the log-gamma(LG) distribution
### Aliases: Loggammasurvival crf.log.gamma hlog.gamma hra.log.gamma
###   slog.gamma
### Keywords: survival

### ** Examples

## load data set
data(conductors)
## Maximum Likelihood(ML) Estimates of alpha & lambda for the data(conductors)
## Estimates of alpha & lambda using 'maxLik' package
## alpha.est = 0.0088741, lambda.est = 0.6059935

## Reliability indicators for data(conductors):

## Reliability function
slog.gamma(conductors, 0.0088741, 0.6059935)

## Hazard function
hlog.gamma(conductors, 0.0088741, 0.6059935)

## hazard rate average(hra)
hra.log.gamma(conductors, 0.0088741, 0.6059935)

## Conditional reliability function (age component=0)
crf.log.gamma(conductors, 0.00, 0.0088741, 0.6059935)

## Conditional reliability function (age component=3.0)
crf.log.gamma(conductors, 3.0, 0.0088741, 0.6059935)



