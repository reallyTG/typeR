library(PortfolioEffectHFT)


### Name: return_autocovariance
### Title: Return Autocovariance
### Aliases: return_autocovariance return_autocovariance,position-method
### Keywords: PortfolioEffectHFT return_autocovariance

### ** Examples

## Not run: 
##D data(aapl.data) 
##D data(goog.data) 
##D data(spy.data) 
##D portfolio=portfolio_create(priceDataIx=spy.data)
##D portfolio_settings(portfolio,windowLength = '3600s',resultsSamplingInterval='60s')
##D positionGOOG=position_add(portfolio,'GOOG',100,priceData=goog.data)   
##D positionAAPL=position_add(portfolio,'AAPL',300,priceData=aapl.data) 
##D result=compute(return_autocovariance(positionGOOG,10),return_autocovariance(positionAAPL,10)) 
##D plot(return_autocovariance(positionGOOG,10),return_autocovariance(positionAAPL,10),
##D legend=c('GOOG','AAPL'),title='Return Autocovariance')
##D 
##D dateStart = "2014-11-17 09:30:00"
##D dateEnd = "2014-11-17 16:00:00"
##D portfolio=portfolio_create(dateStart,dateEnd)
##D portfolio_settings(portfolio,portfolioMetricsMode="price",windowLength = '3600s',
##D resultsSamplingInterval='60s')
##D positionAAPL=position_add(portfolio,'AAPL',100)
##D positionC=position_add(portfolio,'C',300) 
##D positionGOOG=position_add(portfolio,'GOOG',150) 
##D result=compute(return_autocovariance(positionC,10),return_autocovariance(positionGOOG,10),
##D return_autocovariance(positionAAPL,10)) 
##D plot(return_autocovariance(positionC,10),return_autocovariance(positionGOOG,10),
##D return_autocovariance(positionAAPL,10),legend=c('C','GOOG','AAPL'),title='Return Autocovariance')
## End(Not run)


