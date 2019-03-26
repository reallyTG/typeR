library(reliaR)


### Name: Gompertzsurvival
### Title: Survival related functions for the Gompertz distribution
### Aliases: Gompertzsurvival crf.gompertz hgompertz hra.gompertz sgompertz
### Keywords: survival

### ** Examples

## load data set
data(sys2)
## Maximum Likelihood(ML) Estimates of alpha & theta for the data(sys2)
## Estimates of alpha & theta using 'maxLik' package
## alpha.est = 0.00121307, theta.est = 0.00173329

## Reliability indicators for data(sys2):

## Reliability function
sgompertz(sys2, 0.00121307, 0.00173329)

## Hazard function
hgompertz(sys2, 0.00121307, 0.00173329)

## hazard rate average(hra)
hra.gompertz(sys2, 0.00121307, 0.00173329)

## Conditional reliability function (age component=0)
crf.gompertz(sys2, 0.00, 0.00121307, 0.00173329)

## Conditional reliability function (age component=3.0)
crf.gompertz(sys2, 3.0, 0.00121307, 0.00173329)



