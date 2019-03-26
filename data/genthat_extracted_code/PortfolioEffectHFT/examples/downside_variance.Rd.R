library(PortfolioEffectHFT)


### Name: downside_variance
### Title: Downside Variance
### Aliases: downside_variance downside_variance,portfolio-method
###   downside_variance,position-method
### Keywords: PortfolioEffectHFT downside_variance

### ** Examples

## Not run: 
##D data(aapl.data) 
##D data(goog.data) 
##D data(spy.data) 
##D portfolio=portfolio_create(priceDataIx=spy.data)
##D portfolio_settings(portfolio,windowLength = '3600s',resultsSamplingInterval='60s')
##D positionGOOG=position_add(portfolio,'GOOG',100,priceData=goog.data)   
##D positionAAPL=position_add(portfolio,'AAPL',300,priceData=aapl.data) 
##D result=compute(downside_variance(portfolio,0.05),downside_variance(positionGOOG,0.05),
##D downside_variance(positionAAPL,0.05)) 
##D plot(downside_variance(portfolio,0.05),downside_variance(positionGOOG,0.05),
##D downside_variance(positionAAPL,0.05),legend=c('Portfolio','GOOG','AAPL'),
##D title='Downside Variance')
##D 
##D dateStart = "2014-11-17 09:30:00"
##D dateEnd = "2014-11-17 16:00:00"
##D portfolio=portfolio_create(dateStart,dateEnd)
##D portfolio_settings(portfolio,portfolioMetricsMode="price",windowLength = '3600s',
##D resultsSamplingInterval='60s')
##D positionAAPL=position_add(portfolio,'AAPL',100)
##D positionC=position_add(portfolio,'C',300) 
##D positionGOOG=position_add(portfolio,'GOOG',150) 
##D result=compute(downside_variance(positionC,0.05),downside_variance(positionGOOG,0.05),
##D downside_variance(positionAAPL,0.05)) 
##D plot(downside_variance(positionC,0.05),downside_variance(positionGOOG,0.05),
##D downside_variance(positionAAPL,0.05),legend=c('C','GOOG','AAPL'),
##D title='Downside Variance')
## End(Not run)


