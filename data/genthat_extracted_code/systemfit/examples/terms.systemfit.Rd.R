library(systemfit)


### Name: terms.systemfit
### Title: Model Terms of systemfit Objects
### Aliases: terms.systemfit terms.systemfit.equation
### Keywords: models

### ** Examples

data( "Kmenta" )
eqDemand <- consump ~ price + income
eqSupply <- consump ~ price + farmPrice + trend
system <- list( demand = eqDemand, supply = eqSupply )

## perform a SUR estimation
fitsur <- systemfit( system, "SUR", data = Kmenta )

## model terms of the second equation
terms( fitsur$eq[[ 2 ]] )

## all model terms of the system
terms( fitsur )



