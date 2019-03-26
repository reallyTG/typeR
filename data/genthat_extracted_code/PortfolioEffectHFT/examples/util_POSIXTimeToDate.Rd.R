library(PortfolioEffectHFT)


### Name: util_POSIXTimeToDate
### Title: POSIX Time To Date
### Aliases: util_POSIXTimeToDate
### Keywords: PortfolioEffectHFT util_POSIXTimeToDate

### ** Examples

## Not run: 
##D data(aapl.data) 
##D data(goog.data) 
##D data(spy.data) 
##D portfolio=portfolio_create(priceDataIx=spy.data)
##D portfolio_settings(portfolio,windowLength = '3600s',resultsSamplingInterval='60s')
##D positionGOOG=position_add(portfolio,'GOOG',100,priceData=goog.data)   
##D positionAAPL=position_add(portfolio,'AAPL',300,priceData=aapl.data) 
##D util_POSIXTimeToDate(compute(kurtosis(portfolio))[[1]][,1])
## End(Not run)


