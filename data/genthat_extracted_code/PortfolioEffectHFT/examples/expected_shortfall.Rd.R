library(PortfolioEffectHFT)


### Name: expected_shortfall
### Title: Expected Shortfall
### Aliases: expected_shortfall expected_shortfall,portfolio-method
###   expected_shortfall,position-method
### Keywords: PortfolioEffectHFT expected_shortfall

### ** Examples

## Not run: 
##D data(aapl.data) 
##D data(goog.data) 
##D data(spy.data) 
##D portfolio=portfolio_create(priceDataIx=spy.data)
##D portfolio_settings(portfolio,windowLength = '3600s',resultsSamplingInterval='60s')
##D positionGOOG=position_add(portfolio,'GOOG',100,priceData=goog.data)   
##D positionAAPL=position_add(portfolio,'AAPL',300,priceData=aapl.data) 
##D result=compute(expected_shortfall(portfolio,0.95),expected_shortfall(positionGOOG,0.95),
##D expected_shortfall(positionAAPL,0.95)) 
##D plot(expected_shortfall(portfolio,0.95),expected_shortfall(positionGOOG,0.95),
##D expected_shortfall(positionAAPL,0.95),legend=c('Portfolio','GOOG','AAPL'),
##D title='Expected Shortfall')
##D 
##D dateStart = "2014-11-17 09:30:00"
##D dateEnd = "2014-11-17 16:00:00"
##D portfolio=portfolio_create(dateStart,dateEnd)
##D portfolio_settings(portfolio,portfolioMetricsMode="price",windowLength = '3600s',
##D resultsSamplingInterval='60s')
##D positionAAPL=position_add(portfolio,'AAPL',100)
##D positionC=position_add(portfolio,'C',300) 
##D positionGOOG=position_add(portfolio,'GOOG',150) 
##D result=compute(expected_shortfall(positionC,0.95),expected_shortfall(positionGOOG,0.95),
##D expected_shortfall(positionAAPL,0.95)) 
##D plot(expected_shortfall(positionC,0.95),expected_shortfall(positionGOOG,0.95),
##D expected_shortfall(positionAAPL,0.95),legend=c('C','GOOG','AAPL'),
##D title='Expected Shortfall')
## End(Not run)


