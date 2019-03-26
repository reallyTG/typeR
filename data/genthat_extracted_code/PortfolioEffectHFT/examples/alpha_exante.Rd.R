library(PortfolioEffectHFT)


### Name: alpha_exante
### Title: Alpha
### Aliases: alpha_exante alpha_exante,portfolio-method
###   alpha_exante,position-method
### Keywords: PortfolioEffectHFT alpha_exante

### ** Examples

## Not run: 
##D data(aapl.data) 
##D data(goog.data) 
##D data(spy.data) 
##D portfolio=portfolio_create(priceDataIx=spy.data)
##D portfolio_settings(portfolio,windowLength = '600s',resultsSamplingInterval='60s')
##D positionGOOG=position_add(portfolio,'GOOG',100,priceData=goog.data)   
##D positionAAPL=position_add(portfolio,'AAPL',300,priceData=aapl.data)
##D result=compute(alpha_exante(portfolio),alpha_exante(positionGOOG),alpha_exante(positionAAPL))
##D plot(alpha_exante(portfolio),alpha_exante(positionGOOG),alpha_exante(positionAAPL),
##D legend=c('Portfolio','GOOG','AAPL'),title='Alpha')
##D 
##D dateStart = "2014-11-17 09:30:00"
##D dateEnd = "2014-11-17 16:00:00"
##D portfolio=portfolio_create(dateStart,dateEnd)
##D portfolio_settings(portfolio,portfolioMetricsMode="price",windowLength = '3600s',
##D resultsSamplingInterval='60s')
##D positionAAPL=position_add(portfolio,'AAPL',100)
##D positionC=position_add(portfolio,'C',300) 
##D positionGOOG=position_add(portfolio,'GOOG',150) 
##D result=compute(alpha_exante(positionC),alpha_exante(positionGOOG),alpha_exante(positionAAPL)) 
##D plot(alpha_exante(positionC),alpha_exante(positionGOOG),alpha_exante(positionAAPL),
##D legend=c('C','GOOG','AAPL'),title='Alpha')
## End(Not run)


