library(reliaR)


### Name: LogisRayleighsurvival
### Title: Survival related functions for the Logistic-Rayleigh(LR)
###   distribution
### Aliases: LogisRayleighsurvival crf.logis.rayleigh hlogis.rayleigh
###   hra.logis.rayleigh slogis.rayleigh
### Keywords: survival

### ** Examples

## load data set
data(stress)
## Maximum Likelihood(ML) Estimates of alpha & lambda for the data(stress)
## Estimates of alpha & lambda using 'maxLik' package
## alpha.est = 1.4779388, lambda.est = 0.2141343

## Reliability indicators for data(stress):

## Reliability function
slogis.rayleigh(stress, 1.4779388, 0.2141343)

## Hazard function
hlogis.rayleigh(stress, 1.4779388, 0.2141343)

## hazard rate average(hra)
hra.logis.rayleigh(stress, 1.4779388, 0.2141343)

## Conditional reliability function (age component=0)
crf.logis.rayleigh(stress, 0.00, 1.4779388, 0.2141343)

## Conditional reliability function (age component=3.0)
crf.logis.rayleigh(stress, 3.0, 1.4779388, 0.2141343)



