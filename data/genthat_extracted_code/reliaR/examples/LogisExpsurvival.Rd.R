library(reliaR)


### Name: LogisExpsurvival
### Title: Survival related functions for the Logistic-Exponential(LE)
###   distribution
### Aliases: LogisExpsurvival crf.logis.exp hlogis.exp hra.logis.exp
###   slogis.exp
### Keywords: survival

### ** Examples

## load data set
data(bearings)
## Maximum Likelihood(ML) Estimates of alpha & lambda for the data(bearings)
## Estimates of alpha & lambda using 'maxLik' package
## alpha.est = 2.36754, lambda.est = 0.01059

## Reliability indicators for data(bearings):

## Reliability function
slogis.exp(bearings, 2.36754, 0.01059)

## Hazard function
hlogis.exp(bearings, 2.36754, 0.01059)

## hazard rate average(hra)
hra.logis.exp(bearings, 2.36754, 0.01059)

## Conditional reliability function (age component=0)
crf.logis.exp(bearings, 0.00, 2.36754, 0.01059)

## Conditional reliability function (age component=3.0)
crf.logis.exp(bearings, 3.0, 2.36754, 0.01059)



