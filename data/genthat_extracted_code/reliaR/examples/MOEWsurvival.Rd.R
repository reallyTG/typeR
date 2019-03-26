library(reliaR)


### Name: MOEWsurvival
### Title: Survival related functions for the Marshall-Olkin Extended
###   Weibull (MOEW) distribution
### Aliases: MOEWsurvival crf.moew hmoew hra.moew smoew
### Keywords: survival

### ** Examples

## load data set 
data(sys2)
## Maximum Likelihood(ML) Estimates of alpha & lambda for the data(sys2)
## alpha.est = 0.3035937,  lambda.est = 279.2177754
## Reliability indicators for data(sys2):

## Reliability function
smoew(sys2, 0.3035937, 279.2177754)

## Hazard function 
hmoew(sys2, 0.3035937, 279.2177754)

## hazard rate average(hra)
hra.moew(sys2, 0.3035937, 279.2177754)

## Conditional reliability function (age component=0)
crf.moew(sys2, 0.00, 0.3035937, 279.2177754)

## Conditional reliability function (age component=3.0)
crf.moew(sys2, 3.0, 0.3035937, 279.2177754)



