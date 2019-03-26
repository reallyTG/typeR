library(systemfit)


### Name: model.matrix.systemfit
### Title: Construct Design Matrices for Systems of Equations
### Aliases: model.matrix.systemfit model.matrix.systemfit.equation
### Keywords: models

### ** Examples

data( "Kmenta" )
eqDemand <- consump ~ price + income
eqSupply <- consump ~ price + farmPrice + trend
system <- list( demand = eqDemand, supply = eqSupply )

## perform OLS of the system
fitols <- systemfit( system, data = Kmenta )

## design matrix of the entire system
model.matrix( fitols )

## design matrix of the first equation
model.matrix( fitols$eq[[ 1 ]] )



