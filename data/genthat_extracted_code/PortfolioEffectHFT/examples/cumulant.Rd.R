library(PortfolioEffectHFT)


### Name: cumulant
### Title: N-th Cumulant
### Aliases: cumulant cumulant,portfolio-method cumulant,position-method
### Keywords: PortfolioEffectHFT cumulant

### ** Examples

## Not run: 
##D data(aapl.data) 
##D data(goog.data) 
##D data(spy.data) 
##D portfolio=portfolio_create(priceDataIx=spy.data)
##D portfolio_settings(portfolio,windowLength = '3600s',resultsSamplingInterval='60s')
##D positionGOOG=position_add(portfolio,'GOOG',100,priceData=goog.data)   
##D positionAAPL=position_add(portfolio,'AAPL',300,priceData=aapl.data) 
##D result=compute(cumulant(portfolio, 3),cumulant(positionGOOG, 3),cumulant(positionAAPL, 3)) 
##D plot(cumulant(portfolio, 3),cumulant(positionGOOG, 3),cumulant(positionAAPL, 3),
##D legend=c('Portfolio','GOOG','AAPL'),title='3-th Cumulant')
##D 
##D dateStart = "2014-11-17 09:30:00"
##D dateEnd = "2014-11-17 16:00:00"
##D portfolio=portfolio_create(dateStart,dateEnd)
##D portfolio_settings(portfolio,portfolioMetricsMode="price",windowLength = '3600s',
##D resultsSamplingInterval='60s')
##D positionAAPL=position_add(portfolio,'AAPL',100)
##D positionC=position_add(portfolio,'C',300) 
##D positionGOOG=position_add(portfolio,'GOOG',150) 
##D result=compute(cumulant(positionC, 4),cumulant(positionGOOG, 4),cumulant(positionAAPL, 4)) 
##D plot(cumulant(positionC, 4),cumulant(positionGOOG, 4),cumulant(positionAAPL, 4),
##D legend=c('C','GOOG','AAPL'),title='4-th Cumulant')
## End(Not run)


