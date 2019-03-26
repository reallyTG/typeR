library(PortfolioEffectHFT)


### Name: portfolio_defaultSettings
### Title: Portfolio Default Settings
### Aliases: portfolio_defaultSettings
### Keywords: PortfolioEffectHFT portfolio_defaultSettings

### ** Examples

## Not run: 
##D data(aapl.data) 
##D data(goog.data) 
##D data(spy.data) 
##D portfolio=portfolio_create(priceDataIx=spy.data)
##D positionGOOG=position_add(portfolio,'GOOG',100,priceData=goog.data)   
##D positionAAPL=position_add(portfolio,'AAPL',300,priceData=aapl.data) 
##D portfolio_defaultSettings(portfolio,
##D 				   inputSamplingInterval = '10s',
##D 				   resultsSamplingInterval = '10s')
##D portfolio_getSettings(portfolio)
##D portfolio_defaultSettings(portfolio)
##D portfolio_getSettings(portfolio)
##D 
## End(Not run)


