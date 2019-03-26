library(systemfit)


### Name: hausman.systemfit
### Title: Hausman Test
### Aliases: hausman.systemfit
### Keywords: models

### ** Examples

data( "Kmenta" )
eqDemand <- consump ~ price + income
eqSupply <- consump ~ price + farmPrice + trend
inst <- ~ income + farmPrice + trend
system <- list( demand = eqDemand, supply = eqSupply )

## perform the estimations
fit2sls <- systemfit( system, "2SLS", inst = inst, data = Kmenta )
fit3sls <- systemfit( system, "3SLS", inst = inst, data = Kmenta )

## perform the Hausman test
h <- hausman.systemfit( fit2sls, fit3sls )
print( h )



