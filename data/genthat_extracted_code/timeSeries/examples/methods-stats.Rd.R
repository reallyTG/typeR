library(timeSeries)


### Name: timeSeries-method-stats
### Title: Time Series Correlations
### Aliases: sd-methods var-methods cov-methods cor-methods dcauchy-methods
###   dnorm-methods dt-methods sd,timeSeries-method var,timeSeries-method
###   cov,timeSeries-method cor,timeSeries-method dcauchy,timeSeries-method
###   dnorm,timeSeries-method dt,timeSeries-method
### Keywords: methods chron

### ** Examples

## Load Microsoft Data Set - 
   data(MSFT)
   X = MSFT[, 1:4]
   X = 100 * returns(X)

## Compute Covariance Matrix - 
   cov(X[, "Open"], X[, "Close"])
   cov(X)



