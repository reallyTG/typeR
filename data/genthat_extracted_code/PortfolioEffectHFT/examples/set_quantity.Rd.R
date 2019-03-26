library(PortfolioEffectHFT)


### Name: set_quantity
### Title: Set Position Quantity
### Aliases: set_quantity set_quantity,position,numeric-method
###   set_quantity,position,integer-method
### Keywords: PortfolioEffectHFT set_quantity

### ** Examples

## Not run: 
##D data(aapl.data) 
##D data(goog.data) 
##D data(spy.data) 
##D portfolio=portfolio_create(priceDataIx=spy.data)
##D portfolio_settings(portfolio,windowLength = '3600s',resultsSamplingInterval='60s')
##D positionGOOG=position_add(portfolio,'GOOG',100,priceData=goog.data)   
##D positionAAPL=position_add(portfolio,'AAPL',300,priceData=aapl.data) 
##D print(portfolio)
##D 
##D set_quantity(positionGOOG,400)
##D print(portfolio)
## End(Not run)


