library(systemfit)


### Name: fitted.systemfit
### Title: Fitted values
### Aliases: fitted.systemfit fitted.systemfit.equation
### Keywords: models

### ** Examples

data( "Kmenta" )
eqDemand <- consump ~ price + income
eqSupply <- consump ~ price + farmPrice + trend
system <- list( demand = eqDemand, supply = eqSupply )

## perform OLS on each of the equations in the system
fitols <- systemfit( system, data = Kmenta )

## all fitted values
fitted( fitols )

## fitted values of the first equation
fitted( fitols$eq[[1]] )

## fitted values of the second equation
fitted( fitols$eq[[2]] )



