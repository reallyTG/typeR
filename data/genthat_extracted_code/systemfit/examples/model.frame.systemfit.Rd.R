library(systemfit)


### Name: model.frame.systemfit
### Title: Extracting the Data of a systemfit Object
### Aliases: model.frame.systemfit model.frame.systemfit.equation
### Keywords: models

### ** Examples

data( "Kmenta" )
eqDemand <- consump ~ price + income
eqSupply <- consump ~ price + farmPrice + trend
system <- list( demand = eqDemand, supply = eqSupply )

## perform OLS of the system
fitols <- systemfit( system, data = Kmenta )

## data used to estimate the entire system
model.frame( fitols )

## data used to estimate the first equation
model.frame( fitols$eq[[ 1 ]] )



