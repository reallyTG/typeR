library(PortfolioEffectHFT)


### Name: treynor_ratio
### Title: Treynor Ratio
### Aliases: treynor_ratio treynor_ratio,portfolio-method
###   treynor_ratio,position-method
### Keywords: PortfolioEffectHFT treynor_ratio

### ** Examples

## Not run: 
##D data(aapl.data) 
##D data(goog.data) 
##D data(spy.data) 
##D portfolio=portfolio_create(priceDataIx=spy.data)
##D portfolio_settings(portfolio,windowLength = '3600s',resultsSamplingInterval='60s')
##D positionGOOG=position_add(portfolio,'GOOG',100,priceData=goog.data)   
##D positionAAPL=position_add(portfolio,'AAPL',300,priceData=aapl.data) 
##D result=compute(treynor_ratio(portfolio),treynor_ratio(positionGOOG),treynor_ratio(positionAAPL)) 
##D plot(treynor_ratio(portfolio),treynor_ratio(positionGOOG),treynor_ratio(positionAAPL),
##D legend=c('Portfolio','GOOG','AAPL'),title='Treynor Ratio')
##D 
##D dateStart = "2014-11-17 09:30:00"
##D dateEnd = "2014-11-17 16:00:00"
##D portfolio=portfolio_create(dateStart,dateEnd)
##D portfolio_settings(portfolio,portfolioMetricsMode="price",windowLength = '3600s',
##D resultsSamplingInterval='60s')
##D positionAAPL=position_add(portfolio,'AAPL',100)
##D positionC=position_add(portfolio,'C',300) 
##D positionGOOG=position_add(portfolio,'GOOG',150) 
##D result=compute(treynor_ratio(positionC),treynor_ratio(positionGOOG),treynor_ratio(positionAAPL)) 
##D plot(treynor_ratio(positionC),treynor_ratio(positionGOOG),treynor_ratio(positionAAPL),
##D legend=c('C','GOOG','AAPL'),title='Treynor Ratio')
## End(Not run)


