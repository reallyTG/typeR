library(systemfit)


### Name: print.confint.systemfit
### Title: Print confidence intervals of coefficients
### Aliases: print.confint.systemfit
### Keywords: models regression

### ** Examples

data( "Kmenta" )
eqDemand <- consump ~ price + income
eqSupply <- consump ~ price + farmPrice + trend
system <- list( demand = eqDemand, supply = eqSupply )

## perform OLS on each of the equations in the system
fitols <- systemfit( system, data = Kmenta )

## calculate and print the confidence intervals
## of all coefficients
ci <- confint( fitols )
print( ci, digits=4 )

## calculate and print the confidence intervals
## of the coefficients of the second equation
ci2 <- confint( fitols$eq[[2]] )
print( ci2, digits=4 )



