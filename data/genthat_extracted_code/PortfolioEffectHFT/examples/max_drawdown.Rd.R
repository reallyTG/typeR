library(PortfolioEffectHFT)


### Name: max_drawdown
### Title: Max Drawdown
### Aliases: max_drawdown max_drawdown,portfolio-method
###   max_drawdown,position-method
### Keywords: PortfolioEffectHFT max_drawdown

### ** Examples

## Not run: 
##D data(aapl.data) 
##D data(goog.data) 
##D data(spy.data) 
##D portfolio=portfolio_create(priceDataIx=spy.data)
##D portfolio_settings(portfolio,windowLength = '3600s',resultsSamplingInterval='60s')
##D positionGOOG=position_add(portfolio,'GOOG',100,priceData=goog.data)   
##D positionAAPL=position_add(portfolio,'AAPL',300,priceData=aapl.data) 
##D result=compute(max_drawdown(portfolio),max_drawdown(positionGOOG),max_drawdown(positionAAPL)) 
##D plot(max_drawdown(portfolio),max_drawdown(positionGOOG),max_drawdown(positionAAPL),
##D legend=c('Portfolio','GOOG','AAPL'),title='Max Drawdown')
##D 
##D dateStart = "2014-11-17 09:30:00"
##D dateEnd = "2014-11-17 16:00:00"
##D portfolio=portfolio_create(dateStart,dateEnd)
##D positionAAPL=position_add(portfolio,'AAPL',100)
##D positionC=position_add(portfolio,'C',300) 
##D positionGOOG=position_add(portfolio,'GOOG',150) 
##D result=compute(max_drawdown(positionC),max_drawdown(positionGOOG),max_drawdown(positionAAPL)) 
##D plot(max_drawdown(positionC),max_drawdown(positionGOOG),max_drawdown(positionAAPL),
##D legend=c('C','GOOG','AAPL'),title='Max Drawdown')
## End(Not run)


