library(PortfolioEffectHFT)


### Name: expected_upside_return
### Title: Expected Upside Return
### Aliases: expected_upside_return expected_upside_return,portfolio-method
###   expected_upside_return,position-method
### Keywords: PortfolioEffectHFT expected_upside_return

### ** Examples

## Not run: 
##D data(aapl.data) 
##D data(goog.data) 
##D data(spy.data) 
##D portfolio=portfolio_create(priceDataIx=spy.data)
##D portfolio_settings(portfolio,windowLength = '3600s',resultsSamplingInterval='60s')
##D positionGOOG=position_add(portfolio,'GOOG',100,priceData=goog.data)   
##D positionAAPL=position_add(portfolio,'AAPL',300,priceData=aapl.data) 
##D result=compute(expected_upside_return(portfolio,0.05),
##D expected_upside_return(positionGOOG,0.05),expected_upside_return(positionAAPL,0.05)) 
##D plot(expected_upside_return(portfolio,0.05),expected_upside_return(positionGOOG,0.05),
##D expected_upside_return(positionAAPL,0.05),legend=c('Portfolio','GOOG','AAPL'),
##D title='Expected Upside Return')
##D 
##D dateStart = "2014-11-17 09:30:00"
##D dateEnd = "2014-11-17 16:00:00"
##D portfolio=portfolio_create(dateStart,dateEnd)
##D portfolio_settings(portfolio,portfolioMetricsMode="price",windowLength = '3600s',
##D resultsSamplingInterval='60s')
##D positionAAPL=position_add(portfolio,'AAPL',100)
##D positionC=position_add(portfolio,'C',300) 
##D positionGOOG=position_add(portfolio,'GOOG',150) 
##D result=compute(expected_upside_return(positionC,0.05),
##D expected_upside_return(positionGOOG,0.05),expected_upside_return(positionAAPL,0.05)) 
##D plot(expected_upside_return(positionC,0.05),expected_upside_return(positionGOOG,0.05),
##D expected_upside_return(positionAAPL,0.05),legend=c('C','GOOG','AAPL'),
##D title='Expected Upside Return')
## End(Not run)


