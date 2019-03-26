library(PortfolioEffectHFT)


### Name: fractal_dimension
### Title: Fractal Dimension
### Aliases: fractal_dimension fractal_dimension,portfolio-method
###   fractal_dimension,position-method
### Keywords: PortfolioEffectHFT fractal_dimension

### ** Examples

## Not run: 
##D data(aapl.data) 
##D data(goog.data) 
##D data(spy.data) 
##D portfolio=portfolio_create(priceDataIx=spy.data)
##D portfolio_settings(portfolio,windowLength = '3600s',resultsSamplingInterval='60s')
##D positionGOOG=position_add(portfolio,'GOOG',100,priceData=goog.data)   
##D positionAAPL=position_add(portfolio,'AAPL',300,priceData=aapl.data) 
##D result=compute(fractal_dimension(portfolio),fractal_dimension(positionGOOG),
##D fractal_dimension(positionAAPL)) 
##D plot(fractal_dimension(portfolio),fractal_dimension(positionGOOG),
##D fractal_dimension(positionAAPL),legend=c('Portfolio','GOOG','AAPL'),title='Fractal Dimension')
##D 
##D dateStart = "2014-11-17 09:30:00"
##D dateEnd = "2014-11-17 16:00:00"
##D portfolio=portfolio_create(dateStart,dateEnd)
##D portfolio_settings(portfolio,portfolioMetricsMode="price",windowLength = '3600s',
##D resultsSamplingInterval='60s')
##D positionAAPL=position_add(portfolio,'AAPL',100)
##D positionC=position_add(portfolio,'C',300) 
##D positionGOOG=position_add(portfolio,'GOOG',150) 
##D result=compute(fractal_dimension(positionC),fractal_dimension(positionGOOG),
##D fractal_dimension(positionAAPL)) 
##D plot(fractal_dimension(positionC),fractal_dimension(positionGOOG),
##D fractal_dimension(positionAAPL),legend=c('C','GOOG','AAPL'),title='Fractal Dimension')
## End(Not run)


