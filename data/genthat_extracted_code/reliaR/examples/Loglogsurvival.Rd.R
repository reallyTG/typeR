library(reliaR)


### Name: Loglogsurvival
### Title: Survival related functions for the Loglog distribution
### Aliases: Loglogsurvival crf.loglog hloglog hra.loglog sloglog
### Keywords: survival

### ** Examples

## load data set 
data(sys2)
## Maximum Likelihood(ML) Estimates of alpha & lambda for the data(sys2)
## alpha.est = 0.9058689 lambda.est = 1.0028228

## Reliability indicators for data(sys2):

## Reliability function
sloglog(sys2, 0.9058689, 1.0028228)

## Hazard function 
hloglog(sys2, 0.9058689, 1.0028228)

## hazard rate average(hra)
hra.loglog(sys2, 0.9058689, 1.0028228)

## Conditional reliability function (age component=0)
crf.loglog(sys2, 0.00, 0.9058689, 1.0028228)

## Conditional reliability function (age component=3.0)
crf.loglog(sys2, 3.0, 0.9058689, 1.0028228)



