library(systemfit)


### Name: se.ratio.systemfit
### Title: Ratio of the Standard Errors
### Aliases: se.ratio.systemfit
### Keywords: models

### ** Examples

data( "Kmenta" )
eqDemand <- consump ~ price + income
eqSupply <- consump ~ price + farmPrice + trend
inst <- ~ income + farmPrice + trend
system <- list( demand = eqDemand, supply = eqSupply )

## perform 2SLS on each of the equations in the system
fit2sls <- systemfit( system, "2SLS", inst = inst, data = Kmenta )
fit3sls <- systemfit( system, "3SLS", inst = inst, data = Kmenta )

## print the results from the fits
print( fit2sls )
print( fit3sls )
print( "covariance of residuals used for estimation (from 2sls)" )
print( fit3sls$residCovEst )
print( "covariance of residuals" )
print( fit3sls$residCov )

## examine the improvement of 3SLS over 2SLS by computing
## the ratio of the standard errors of the estimates
improve.ratio <- se.ratio.systemfit( fit2sls, fit3sls, 2 )
print( "summary values for the ratio in the std. err. for the predictions" )
print( summary( improve.ratio ) )



