library(PortfolioEffectHFT)


### Name: value
### Title: Value
### Aliases: value value,portfolio-method value,position-method
### Keywords: PortfolioEffectHFT value

### ** Examples

## Not run: 
##D data(aapl.data) 
##D data(goog.data) 
##D data(spy.data) 
##D portfolio=portfolio_create(priceDataIx=spy.data)
##D portfolio_settings(portfolio,windowLength = '3600s',resultsSamplingInterval='60s')
##D positionGOOG=position_add(portfolio,'GOOG',100,priceData=goog.data)   
##D positionAAPL=position_add(portfolio,'AAPL',300,priceData=aapl.data) 
##D result=compute(value(portfolio),value(positionGOOG),value(positionAAPL)) 
##D plot(value(portfolio),value(positionGOOG),value(positionAAPL),
##D legend=c('Portfolio','GOOG','AAPL'),title='Value')
##D 
##D dateStart = "2014-11-17 09:30:00"
##D dateEnd = "2014-11-17 16:00:00"
##D portfolio=portfolio_create(dateStart,dateEnd)
##D portfolio_settings(portfolio,portfolioMetricsMode="price",windowLength = '3600s',
##D resultsSamplingInterval='60s')
##D positionAAPL=position_add(portfolio,'AAPL',100)
##D positionC=position_add(portfolio,'C',300) 
##D positionGOOG=position_add(portfolio,'GOOG',150) 
##D result=compute(value(positionC),value(positionGOOG),value(positionAAPL)) 
##D plot(value(positionC),value(positionGOOG),value(positionAAPL),
##D legend=c('C','GOOG','AAPL'),title='Value')
## End(Not run)


