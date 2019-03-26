library(systemfit)


### Name: summary.systemfit
### Title: Summary of systemfit estimation
### Aliases: summary.systemfit summary.systemfit.equation
###   print.summary.systemfit print.summary.systemfit.equation
### Keywords: models

### ** Examples

data( "Kmenta" )
eqDemand <- consump ~ price + income
eqSupply <- consump ~ price + farmPrice + trend
inst <- ~ income + farmPrice + trend
system <- list( demand = eqDemand, supply = eqSupply )

## perform OLS on each of the equations in the system
fitols <- systemfit( system, data = Kmenta )

## results of the system
summary( fitols )

## short results of the system
summary( fitols, residCov = FALSE, equations = FALSE )

## results of the first equation
summary( fitols$eq[[1]] )

## results of the second equation
summary( fitols$eq[[2]] )



