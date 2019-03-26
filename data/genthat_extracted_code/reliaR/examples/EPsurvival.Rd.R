library(reliaR)


### Name: EPsurvival
### Title: Survival related functions for the Exponential Power(EP)
###   distribution
### Aliases: EPsurvival crf.exp.power hexp.power hra.exp.power sexp.power
### Keywords: survival

### ** Examples

## Load data sets
data(sys2)
## Maximum Likelihood(ML) Estimates of alpha & lambda for the data(sys2)
## alpha.est = 0.905868898, lambda.est =  0.001531423

## Reliability indicators:

## Reliability function
sexp.power(sys2, 0.905868898, 0.001531423)

## Hazard function 
hexp.power(sys2, 0.905868898, 0.001531423)

## hazard rate average(hra)
hra.exp.power(sys2, 0.905868898, 0.001531423)

## Conditional reliability function (age component=0)
crf.exp.power(sys2, 0.00, 0.905868898, 0.001531423)

## Conditional reliability function (age component=3.0)
crf.exp.power(sys2, 3.0, 0.905868898, 0.001531423)



