library(systemfit)


### Name: logLik.systemfit
### Title: Log-Likelihood value of systemfit object
### Aliases: logLik.systemfit
### Keywords: models

### ** Examples

data( "Kmenta" )
eqDemand <- consump ~ price + income
eqSupply <- consump ~ price + farmPrice + trend
system <- list( demand = eqDemand, supply = eqSupply )

## perform a SUR estimation
fitsur <- systemfit( system, "SUR", data = Kmenta )

## residuals of all equations
logLik( fitsur )



