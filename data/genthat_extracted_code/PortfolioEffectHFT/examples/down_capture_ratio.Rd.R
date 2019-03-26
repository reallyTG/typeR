library(PortfolioEffectHFT)


### Name: down_capture_ratio
### Title: Down Capture Ratio
### Aliases: down_capture_ratio down_capture_ratio,portfolio-method
###   down_capture_ratio,position-method
### Keywords: PortfolioEffectHFT down_capture_ratio

### ** Examples

## Not run: 
##D data(aapl.data) 
##D data(goog.data) 
##D data(spy.data) 
##D portfolio=portfolio_create(priceDataIx=spy.data)
##D portfolio_settings(portfolio,windowLength = '3600s',resultsSamplingInterval='60s')
##D positionGOOG=position_add(portfolio,'GOOG',100,priceData=goog.data)   
##D positionAAPL=position_add(portfolio,'AAPL',300,priceData=aapl.data) 
##D result=compute(down_capture_ratio(portfolio),down_capture_ratio(positionGOOG),
##D down_capture_ratio(positionAAPL)) 
##D plot(down_capture_ratio(portfolio),down_capture_ratio(positionGOOG),
##D down_capture_ratio(positionAAPL),legend=c('Portfolio','GOOG','AAPL'),
##D title='Down Capture Ratio')
##D 
##D dateStart = "2014-11-17 09:30:00"
##D dateEnd = "2014-11-17 16:00:00"
##D portfolio=portfolio_create(dateStart,dateEnd)
##D portfolio_settings(portfolio,portfolioMetricsMode="price",windowLength = '3600s',
##D resultsSamplingInterval='60s')
##D positionAAPL=position_add(portfolio,'AAPL',100)
##D positionC=position_add(portfolio,'C',300) 
##D positionGOOG=position_add(portfolio,'GOOG',150) 
##D result=compute(down_capture_ratio(positionC),down_capture_ratio(positionGOOG),
##D down_capture_ratio(positionAAPL)) 
##D plot(down_capture_ratio(positionC),down_capture_ratio(positionGOOG),
##D down_capture_ratio(positionAAPL),legend=c('C','GOOG','AAPL'),
##D title='Down Capture Ratio')
## End(Not run)


