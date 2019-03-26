library(reliaR)


### Name: InvGenExpEsurvival
### Title: Survival related functions for the Inverse Generalized
###   Exponential(IGE) distribution
### Aliases: InvGenExpsurvival crf.inv.genexp hinv.genexp hra.inv.genexp
###   sinv.genexp
### Keywords: survival

### ** Examples

## load data set
data(repairtimes)
## Maximum Likelihood(ML) Estimates of alpha & lambda for the data(repairtimes)
## Estimates of alpha & lambda using 'maxLik' package
## alpha.est = 1.097807, lambda.est = 1.206889

## Reliability indicators for data(repairtimes):

## Reliability function
sinv.genexp(repairtimes, 1.097807, 1.206889)

## Hazard function
hinv.genexp(repairtimes, 1.097807, 1.206889)

## hazard rate average(hra)
hra.inv.genexp(repairtimes, 1.097807, 1.206889)

## Conditional reliability function (age component=0)
crf.inv.genexp(repairtimes, 0.00, 1.097807, 1.206889)

## Conditional reliability function (age component=3.0)
crf.inv.genexp(repairtimes, 3.0, 1.097807, 1.206889)



