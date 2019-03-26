library(PortfolioEffectHFT)


### Name: dist_density
### Title: Probability Density Function of Portfolio Returns
### Aliases: dist_density dist_density,portfolio-method
###   dist_density,position-method
### Keywords: PortfolioEffectHFT dist_density

### ** Examples

## Not run: 
##D 
##D data(aapl.data) 
##D data(goog.data) 
##D data(spy.data) 
##D portfolio=portfolio_create(priceDataIx=spy.data)
##D portfolio_settings(portfolio,windowLength = '3600s',resultsSamplingInterval='60s')
##D positionGOOG=position_add(portfolio,'GOOG',100,priceData=goog.data)   
##D positionAAPL=position_add(portfolio,'AAPL',300,priceData=aapl.data) 
##D util_plotDensity(dist_density(portfolio,pValueLeft=0.2,pValueRight=0.8,nPoints=100,
##D addNormalDensity=TRUE))
##D 
##D dateStart = "2014-11-17 09:30:00"
##D dateEnd = "2014-11-17 16:00:00"
##D portfolio=portfolio_create(dateStart,dateEnd)
##D portfolio_settings(portfolio,portfolioMetricsMode="price",windowLength = '3600s',
##D resultsSamplingInterval='60s')
##D positionAAPL=position_add(portfolio,'AAPL',100)
##D positionC=position_add(portfolio,'C',300) 
##D positionGOOG=position_add(portfolio,'GOOG',150) 
##D util_plotDensity(dist_density(portfolio,pValueLeft=0,pValueRight=1,nPoints=100,
##D addNormalDensity=TRUE))
## End(Not run)


