library(reliaR)


### Name: BurrXsurvival
### Title: Survival related functions for the BurrX distribution
### Aliases: BurrXsurvival crf.burrX hburrX hra.burrX sburrX
### Keywords: survival

### ** Examples

## load data set
data(bearings)
## Maximum Likelihood(ML) Estimates of alpha & lambda for the data(bearings)
## Estimates of alpha & lambda using 'maxLik' package
## alpha.est = 1.1989515, lambda.est = 0.0130847

## Reliability indicators for data(bearings):

## Reliability function
sburrX(bearings, 1.1989515, 0.0130847)

## Hazard function
hburrX(bearings, 1.1989515, 0.0130847)

## hazard rate average(hra)
hra.burrX(bearings, 1.1989515, 0.0130847)

## Conditional reliability function (age component=0)
crf.burrX(bearings, 0.00, 1.1989515, 0.0130847)

## Conditional reliability function (age component=3.0)
crf.burrX(bearings, 3.0, 1.1989515, 0.0130847)



