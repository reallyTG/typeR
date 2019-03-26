library(reliaR)


### Name: ExpExtsurvival
### Title: Survival related functions for the Exponential Extension(EE)
###   distribution
### Aliases: ExpExtsurvival crf.exp.ext hexp.ext hra.exp.ext sexp.ext
### Keywords: survival

### ** Examples

## load data set
data(sys2)
## Maximum Likelihood(ML) Estimates of alpha & lambda for the data(sys2)
## Estimates of alpha & lambda using 'maxLik' package
## alpha.est = 1.0126e+01, lambda.est = 1.5848e-04

## Reliability indicators for data(sys2):

## Reliability function
sexp.ext(sys2, 1.0126e+01, 1.5848e-04)

## Hazard function
hexp.ext(sys2, 1.0126e+01, 1.5848e-04)

## hazard rate average(hra)
hra.exp.ext(sys2, 1.0126e+01, 1.5848e-04)

## Conditional reliability function (age component=0)
crf.exp.ext(sys2, 0.00, 1.0126e+01, 1.5848e-04)

## Conditional reliability function (age component=3.0)
crf.exp.ext(sys2, 3.0, 1.0126e+01, 1.5848e-04)




