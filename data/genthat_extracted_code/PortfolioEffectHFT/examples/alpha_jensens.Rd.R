library(PortfolioEffectHFT)


### Name: alpha_jensens
### Title: Jensen's Alpha
### Aliases: alpha_jensens alpha_jensens,portfolio-method
###   alpha_jensens,position-method
### Keywords: PortfolioEffectHFT alpha_jensens

### ** Examples

## Not run: 
##D data(aapl.data) 
##D data(goog.data) 
##D data(spy.data) 
##D portfolio=portfolio_create(spy.data)
##D portfolio_settings(portfolio,windowLength = '3600s',resultsSamplingInterval='60s')
##D positionGOOG=position_add(portfolio,'GOOG',100,priceData=goog.data)   
##D positionAAPL=position_add(portfolio,'AAPL',300,priceData=aapl.data) 
##D result=compute(alpha_jensens(portfolio),alpha_jensens(positionGOOG),alpha_jensens(positionAAPL)) 
##D plot(alpha_jensens(portfolio),alpha_jensens(positionGOOG),alpha_jensens(positionAAPL),
##D legend=c('Portfolio','GOOG','AAPL'),title="Jensen's Alpha")
##D 
##D dateStart = "2014-11-17 09:30:00"
##D dateEnd = "2014-11-17 16:00:00"
##D portfolio=portfolio_create(dateStart,dateEnd)
##D portfolio_settings(portfolio,portfolioMetricsMode="price",windowLength = '3600s',
##D resultsSamplingInterval='60s')
##D positionAAPL=position_add(portfolio,'AAPL',100)
##D positionC=position_add(portfolio,'C',300) 
##D positionGOOG=position_add(portfolio,'GOOG',150) 
##D result=compute(alpha_jensens(positionC),alpha_jensens(positionGOOG),alpha_jensens(positionAAPL)) 
##D plot(alpha_jensens(positionC),alpha_jensens(positionGOOG),alpha_jensens(positionAAPL),
##D legend=c('C','GOOG','AAPL'),title="Jensen's Alpha")
## End(Not run)


