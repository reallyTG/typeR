library(reliaR)


### Name: Chensurvival
### Title: Survival related functions for the Chen distribution
### Aliases: Chensurvival crf.chen hchen hra.chen schen
### Keywords: survival

### ** Examples

## Maximum Likelihood(ML) Estimates of beta & lambda 
## beta.est = 0.262282404, lambda.est = 0.007282371
## Load data sets
data(sys2)

## Reliability indicators:

## Reliability function
schen(sys2, 0.262282404, 0.007282371)

## Hazard function 
hchen(sys2, 0.262282404, 0.007282371)

## hazard rate average(hra)
hra.chen(sys2, 0.262282404, 0.007282371)

## Conditional reliability function (age component=0)
crf.chen(sys2, 0.00, 0.262282404, 0.007282371)

## Conditional reliability function (age component=3.0)
crf.chen(sys2, 3.0, 0.262282404, 0.007282371)



