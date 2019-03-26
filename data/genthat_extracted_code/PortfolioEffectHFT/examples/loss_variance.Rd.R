library(PortfolioEffectHFT)


### Name: loss_variance
### Title: Loss Variance
### Aliases: loss_variance loss_variance,portfolio-method
###   loss_variance,position-method
### Keywords: PortfolioEffectHFT loss_variance

### ** Examples

## Not run: 
##D data(aapl.data) 
##D data(goog.data) 
##D data(spy.data) 
##D portfolio=portfolio_create(priceDataIx=spy.data)
##D portfolio_settings(portfolio,windowLength = '3600s',resultsSamplingInterval='60s')
##D positionGOOG=position_add(portfolio,'GOOG',100,priceData=goog.data)   
##D positionAAPL=position_add(portfolio,'AAPL',300,priceData=aapl.data) 
##D result=compute(loss_variance(portfolio),loss_variance(positionGOOG),loss_variance(positionAAPL)) 
##D plot(loss_variance(portfolio),loss_variance(positionGOOG),loss_variance(positionAAPL),
##D legend=c('Portfolio','GOOG','AAPL'),title='Loss Variance')
##D 
##D dateStart = "2014-11-17 09:30:00"
##D dateEnd = "2014-11-17 16:00:00"
##D portfolio=portfolio_create(dateStart,dateEnd)
##D portfolio_settings(portfolio,portfolioMetricsMode="price",windowLength = '3600s',
##D resultsSamplingInterval='60s')
##D positionAAPL=position_add(portfolio,'AAPL',100)
##D positionC=position_add(portfolio,'C',300) 
##D positionGOOG=position_add(portfolio,'GOOG',150) 
##D result=compute(loss_variance(positionC),loss_variance(positionGOOG),loss_variance(positionAAPL)) 
##D plot(loss_variance(positionC),loss_variance(positionGOOG),loss_variance(positionAAPL),
##D legend=c('C','GOOG','AAPL'),title='Loss Variance')
## End(Not run)


