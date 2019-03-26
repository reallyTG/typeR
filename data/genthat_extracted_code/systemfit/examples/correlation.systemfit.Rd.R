library(systemfit)


### Name: correlation.systemfit
### Title: Correlation between Predictions from Equation i and j
### Aliases: correlation.systemfit
### Keywords: models

### ** Examples

data( "Kmenta" )
eqDemand <- consump ~ price + income
eqSupply <- consump ~ price + farmPrice + trend
inst <- ~ income + farmPrice + trend
system <- list( demand = eqDemand, supply = eqSupply )

## perform 2SLS on each of the equations in the system
fit2sls <- systemfit( system, "2SLS", inst = inst, data = Kmenta )
print( fit2sls )
print( fit2sls$rcov )

## perform the 3SLS
fit3sls <- systemfit( system, "3SLS", inst = inst, data = Kmenta )
print( fit3sls )
print( "covariance of residuals used for estimation (from 2sls)" )
print( fit3sls$rcovest )
print( "covariance of residuals" )
print( fit3sls$rcov )

## examine the correlation between the predicted values
## of suppy and demand by plotting the correlation over
## the value of q
r12 <- correlation.systemfit( fit3sls, 1, 2 )
plot( Kmenta$consump, r12, main="correlation between predictions from supply and demand" )



