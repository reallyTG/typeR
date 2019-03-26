library(systemfit)


### Name: confint.systemfit
### Title: Confidence intervals of coefficients
### Aliases: confint.systemfit confint.systemfit.equation
### Keywords: models regression

### ** Examples

data( "Kmenta" )
eqDemand <- consump ~ price + income
eqSupply <- consump ~ price + farmPrice + trend
system <- list( demand = eqDemand, supply = eqSupply )

## perform OLS on each of the equations in the system
fitols <- systemfit( system, data = Kmenta )

## confidence intervals of all coefficients
confint( fitols )

## confidence intervals of the coefficients of the first equation
confint( fitols$eq[[1]] )

## confidence intervals of the coefficients of the second equation
confint( fitols$eq[[2]] )



