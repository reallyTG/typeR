library(PortfolioEffectHFT)


### Name: up_capture_ratio
### Title: Up Capture Ratio
### Aliases: up_capture_ratio up_capture_ratio,portfolio-method
###   up_capture_ratio,position-method
### Keywords: PortfolioEffectHFT up_capture_ratio

### ** Examples

## Not run: 
##D data(aapl.data) 
##D data(goog.data) 
##D data(spy.data) 
##D portfolio=portfolio_create(priceDataIx=spy.data)
##D portfolio_settings(portfolio,windowLength = '3600s',resultsSamplingInterval='60s')
##D positionGOOG=position_add(portfolio,'GOOG',100,priceData=goog.data)   
##D positionAAPL=position_add(portfolio,'AAPL',300,priceData=aapl.data) 
##D result=compute(up_capture_ratio(portfolio),up_capture_ratio(positionGOOG),
##D up_capture_ratio(positionAAPL)) 
##D plot(up_capture_ratio(portfolio),up_capture_ratio(positionGOOG),
##D up_capture_ratio(positionAAPL),legend=c('Portfolio','GOOG','AAPL'),title='Up Capture Ratio')
##D 
##D dateStart = "2014-11-17 09:30:00"
##D dateEnd = "2014-11-17 16:00:00"
##D portfolio=portfolio_create(dateStart,dateEnd)
##D positionAAPL=position_add(portfolio,'AAPL',100)
##D positionC=position_add(portfolio,'C',300) 
##D positionGOOG=position_add(portfolio,'GOOG',150) 
##D result=compute(up_capture_ratio(positionC),up_capture_ratio(positionGOOG),
##D up_capture_ratio(positionAAPL)) 
##D plot(up_capture_ratio(positionC),up_capture_ratio(positionGOOG),
##D up_capture_ratio(positionAAPL),legend=c('C','GOOG','AAPL'),title='Up Capture Ratio')
## End(Not run)


