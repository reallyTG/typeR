library(systemfit)


### Name: formula.systemfit
### Title: Model Formulae of systemfit Objects
### Aliases: formula.systemfit formula.systemfit.equation
### Keywords: models

### ** Examples

data( "Kmenta" )
eqDemand <- consump ~ price + income
eqSupply <- consump ~ price + farmPrice + trend
system <- list( demand = eqDemand, supply = eqSupply )

## perform a SUR estimation
fitsur <- systemfit( system, "SUR", data = Kmenta )

## formula of the second equation
formula( fitsur$eq[[2]] )

## all formulae of the system
formula( fitsur )



