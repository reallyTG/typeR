library(PortfolioEffectHFT)


### Name: util_plot2d
### Title: Line plot of portfolio metric (for a time series)
### Aliases: util_plot2d
### Keywords: PortfolioEffectHFT util_plot2d

### ** Examples

## Not run: 
##D data(aapl.data) 
##D data(goog.data) 
##D data(spy.data) 
##D portfolio=portfolio_create(priceDataIx=spy.data)
##D portfolio_settings(portfolio,portfolioMetricsMode="price",windowLength = '3600s')
##D positionGOOG=position_add(portfolio,'GOOG',100,priceData=goog.data)   
##D positionAAPL=position_add(portfolio,'AAPL',300,priceData=aapl.data) 
##D util_plot2d(compute(log_return(portfolio))[[1]],title="Portfolio return")
## End(Not run)


