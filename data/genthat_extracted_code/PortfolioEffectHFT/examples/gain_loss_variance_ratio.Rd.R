library(PortfolioEffectHFT)


### Name: gain_loss_variance_ratio
### Title: Gain Loss Variance Ratio
### Aliases: gain_loss_variance_ratio
###   gain_loss_variance_ratio,portfolio-method
###   gain_loss_variance_ratio,position-method
### Keywords: PortfolioEffectHFT gain_loss_variance_ratio

### ** Examples

## Not run: 
##D data(aapl.data) 
##D data(goog.data) 
##D data(spy.data) 
##D portfolio=portfolio_create(priceDataIx=spy.data)
##D portfolio_settings(portfolio,windowLength = '3600s',resultsSamplingInterval='60s')
##D positionGOOG=position_add(portfolio,'GOOG',100,priceData=goog.data)   
##D positionAAPL=position_add(portfolio,'AAPL',300,priceData=aapl.data) 
##D result=compute(gain_loss_variance_ratio(portfolio),gain_loss_variance_ratio(positionGOOG),
##D gain_loss_variance_ratio(positionAAPL)) 
##D plot(gain_loss_variance_ratio(portfolio),gain_loss_variance_ratio(positionGOOG),
##D gain_loss_variance_ratio(positionAAPL),legend=c('Portfolio','GOOG','AAPL'),
##D title='Gain Loss Variance Ratio')
##D 
##D dateStart = "2014-11-17 09:30:00"
##D dateEnd = "2014-11-17 16:00:00"
##D portfolio=portfolio_create(dateStart,dateEnd)
##D portfolio_settings(portfolio,portfolioMetricsMode="price",windowLength = '3600s',
##D resultsSamplingInterval='60s')
##D positionAAPL=position_add(portfolio,'AAPL',100)
##D positionC=position_add(portfolio,'C',300) 
##D positionGOOG=position_add(portfolio,'GOOG',150) 
##D result=compute(gain_loss_variance_ratio(positionC),gain_loss_variance_ratio(positionGOOG),
##D gain_loss_variance_ratio(positionAAPL)) 
##D plot(gain_loss_variance_ratio(positionC),gain_loss_variance_ratio(positionGOOG),
##D gain_loss_variance_ratio(positionAAPL),legend=c('C','GOOG','AAPL'),
##D title='Gain Loss Variance Ratio')
## End(Not run)


