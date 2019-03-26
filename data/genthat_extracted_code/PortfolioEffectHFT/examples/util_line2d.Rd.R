library(PortfolioEffectHFT)


### Name: util_line2d
### Title: Adds line chart to existing plot
### Aliases: util_line2d
### Keywords: PortfolioEffectHFT util_line2d

### ** Examples

## Not run: 
##D data(aapl.data) 
##D data(goog.data) 
##D data(spy.data) 
##D portfolio=portfolio_create(priceDataIx=spy.data)
##D portfolio_settings(portfolio,portfolioMetricsMode="price",windowLength = '3600s')
##D positionGOOG=position_add(portfolio,'GOOG',100,priceData=goog.data)   
##D positionAAPL=position_add(portfolio,'AAPL',300,priceData=aapl.data) 
##D positionSPY=position_add(portfolio,'SPY',500,priceData=spy.data) 
##D plot(log_return(positionGOOG),title="Positions returns",legend="GOOG")+
##D util_line2d(compute(log_return(positionAAPL))[[1]],legend="AAPL")+
##D util_line2d(compute(log_return(positionSPY))[[1]],legend="SPY")
## End(Not run)


