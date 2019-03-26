library(systemfit)


### Name: Kmenta
### Title: Partly Artificial Data on the U. S. Economy
### Aliases: Kmenta
### Keywords: datasets

### ** Examples

## Replicating the estimations in Kmenta (1986), p. 712, Tab 13-2
data( "Kmenta" )
eqDemand <- consump ~ price + income
eqSupply <- consump ~ price + farmPrice + trend
inst <- ~ income + farmPrice + trend
system <- list( demand = eqDemand, supply = eqSupply )

## OLS estimation
fitOls <- systemfit( system, data = Kmenta )
summary( fitOls )

## 2SLS estimation
fit2sls <- systemfit( system, "2SLS", inst = inst, data = Kmenta )
summary( fit2sls )

## 3SLS estimation
fit3sls <- systemfit( system, "3SLS", inst = inst, data = Kmenta )
summary( fit3sls )

## I3LS estimation
fitI3sls <- systemfit( system, "3SLS", inst = inst, data = Kmenta,
   maxit = 250 )
summary( fitI3sls )



