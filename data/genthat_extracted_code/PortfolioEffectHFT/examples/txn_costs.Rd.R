library(PortfolioEffectHFT)


### Name: txn_costs
### Title: Transactional Costs
### Aliases: txn_costs txn_costs,portfolio-method txn_costs,position-method
### Keywords: PortfolioEffectHFT txn_costs

### ** Examples

## Not run: 
##D 
##D data(aapl.data) 
##D data(goog.data) 
##D data(spy.data) 
##D portfolio=portfolio_create(priceDataIx=spy.data)
##D portfolio_settings(portfolio,windowLength = '3600s',resultsSamplingInterval='60s',txnCostFixed=100)
##D positionGOOG=position_add(portfolio,'GOOG',c(100,200),time=c(1412256601000,1412266600000),
##D priceData=goog.data) 
##D positionAAPL=position_add(portfolio,'AAPL',c(300,150),time=c(1412266600000,1412276600000),
##D priceData=aapl.data) 
##D result=compute(txn_costs(portfolio),txn_costs(positionGOOG),txn_costs(positionAAPL)) 
##D plot(txn_costs(portfolio),txn_costs(positionGOOG),txn_costs(positionAAPL),
##D legend=c('Portfolio','GOOG','AAPL'),title='Transactional Costs')
## End(Not run)


