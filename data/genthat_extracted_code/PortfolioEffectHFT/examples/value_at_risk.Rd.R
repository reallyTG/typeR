library(PortfolioEffectHFT)


### Name: value_at_risk
### Title: Value-at-Risk
### Aliases: value_at_risk value_at_risk,portfolio-method
###   value_at_risk,position-method
### Keywords: PortfolioEffectHFT value_at_risk

### ** Examples

## Not run: 
##D data(aapl.data) 
##D data(goog.data) 
##D data(spy.data) 
##D portfolio=portfolio_create(priceDataIx=spy.data)
##D portfolio_settings(portfolio,windowLength = '3600s',resultsSamplingInterval='60s')
##D positionGOOG=position_add(portfolio,'GOOG',100,priceData=goog.data)   
##D positionAAPL=position_add(portfolio,'AAPL',300,priceData=aapl.data) 
##D result=compute(value_at_risk(portfolio,0.95),value_at_risk(positionGOOG,0.95),
##D value_at_risk(positionAAPL,0.95)) 
##D plot(value_at_risk(portfolio,0.95),value_at_risk(positionGOOG,0.95),
##D value_at_risk(positionAAPL,0.95),legend=c('Portfolio','GOOG','AAPL'),title='Value-at-Risk')
##D 
##D dateStart = "2014-11-17 09:30:00"
##D dateEnd = "2014-11-17 16:00:00"
##D portfolio=portfolio_create(dateStart,dateEnd)
##D portfolio_settings(portfolio,portfolioMetricsMode="price",windowLength = '3600s',
##D resultsSamplingInterval='60s')
##D positionAAPL=position_add(portfolio,'AAPL',100)
##D positionC=position_add(portfolio,'C',300) 
##D positionGOOG=position_add(portfolio,'GOOG',150) 
##D result=compute(value_at_risk(positionC,0.95),value_at_risk(positionGOOG,0.95),
##D value_at_risk(positionAAPL,0.95)) 
##D plot(value_at_risk(positionC,0.95),value_at_risk(positionGOOG,0.95),
##D value_at_risk(positionAAPL,0.95),legend=c('C','GOOG','AAPL'),title='Value-at-Risk')
## End(Not run)


