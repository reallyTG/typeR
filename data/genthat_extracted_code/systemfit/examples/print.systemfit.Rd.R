library(systemfit)


### Name: print.systemfit
### Title: Print results of systemfit estimation
### Aliases: print.systemfit print.systemfit.equation
### Keywords: models

### ** Examples

data( "Kmenta" )
eqDemand <- consump ~ price + income
eqSupply <- consump ~ price + farmPrice + trend
system <- list( demand = eqDemand, supply = eqSupply )

## perform OLS on each of the equations in the system
fitols <- systemfit( system, data = Kmenta )

## results of the whole system
print( fitols )

## results of the first equation
print( fitols$eq[[1]] )

## results of the second equation
print( fitols$eq[[2]] )



