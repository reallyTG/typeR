library(systemfit)


### Name: predict.systemfit
### Title: Predictions from System Estimation
### Aliases: predict.systemfit predict.systemfit.equation
### Keywords: models

### ** Examples

data( "Kmenta" )
eqDemand <- consump ~ price + income
eqSupply <- consump ~ price + farmPrice + trend
system <- list( demand = eqDemand, supply = eqSupply )

## OLS estimation
fitols <- systemfit( system, data=Kmenta )

## predicted values and limits
predict( fitols )

## predicted values of the first equation
predict( fitols$eq[[1]] )

## predicted values of the second equation
predict( fitols$eq[[2]] )



