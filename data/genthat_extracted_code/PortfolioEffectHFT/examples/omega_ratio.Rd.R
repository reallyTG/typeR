library(PortfolioEffectHFT)


### Name: omega_ratio
### Title: Omega Ratio
### Aliases: omega_ratio omega_ratio,portfolio-method
###   omega_ratio,position-method
### Keywords: PortfolioEffectHFT omega_ratio

### ** Examples

## Not run: 
##D data(aapl.data) 
##D data(goog.data) 
##D data(spy.data) 
##D portfolio=portfolio_create(priceDataIx=spy.data)
##D portfolio_settings(portfolio,windowLength = '3600s',resultsSamplingInterval='60s')
##D positionGOOG=position_add(portfolio,'GOOG',100,priceData=goog.data)   
##D positionAAPL=position_add(portfolio,'AAPL',300,priceData=aapl.data) 
##D result=compute(omega_ratio(portfolio,0.05),omega_ratio(positionGOOG,0.05),
##D omega_ratio(positionAAPL,0.05)) 
##D plot(omega_ratio(portfolio,0.05),omega_ratio(positionGOOG,0.05),
##D omega_ratio(positionAAPL,0.05),legend=c('Portfolio','GOOG','AAPL'),title='Omega Ratio')
##D 
##D dateStart = "2014-11-17 09:30:00"
##D dateEnd = "2014-11-17 16:00:00"
##D portfolio=portfolio_create(dateStart,dateEnd)
##D portfolio_settings(portfolio,portfolioMetricsMode="price",windowLength = '3600s',
##D resultsSamplingInterval='60s')
##D positionAAPL=position_add(portfolio,'AAPL',100)
##D positionC=position_add(portfolio,'C',300) 
##D positionGOOG=position_add(portfolio,'GOOG',150) 
##D result=compute(omega_ratio(positionC,0.05),omega_ratio(positionGOOG,0.05),
##D omega_ratio(positionAAPL,0.05)) 
##D plot(omega_ratio(positionC,0.05),omega_ratio(positionGOOG,0.05),
##D omega_ratio(positionAAPL,0.05),legend=c('C','GOOG','AAPL'),title='Omega Ratio')
## End(Not run)


