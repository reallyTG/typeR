library(systemfit)


### Name: residuals.systemfit
### Title: Residuals of systemfit object
### Aliases: residuals.systemfit residuals.systemfit.equation
### Keywords: models

### ** Examples

data( "Kmenta" )
eqDemand <- consump ~ price + income
eqSupply <- consump ~ price + farmPrice + trend
system <- list( demand = eqDemand, supply = eqSupply )

## perform OLS on each of the equations in the system
fitols <- systemfit( system, data = Kmenta )

## residuals of all equations
residuals( fitols )

## residuals of the first equation
residuals( fitols$eq[[1]] )

## residuals of the second equation
residuals( fitols$eq[[2]] )



