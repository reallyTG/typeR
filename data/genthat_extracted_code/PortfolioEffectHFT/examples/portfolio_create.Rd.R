library(PortfolioEffectHFT)


### Name: portfolio_create
### Title: Creates new portfolio
### Aliases: portfolio_create
### Keywords: PortfolioEffectHFT portfolio_create

### ** Examples

## Not run: 
##D data(aapl.data) 
##D data(goog.data) 
##D data(spy.data) 
##D portfolio=portfolio_create(priceDataIx=spy.data)
##D portfolio_settings(portfolio,windowLength = '3600s',resultsSamplingInterval='60s')
##D positionGOOG=position_add(portfolio,'GOOG',100,priceData=goog.data)  
##D positionAAPL=position_add(portfolio,'AAPL',300,priceData=aapl.data) 
##D result=compute(alpha_exante(portfolio),alpha_exante(positionGOOG),alpha_exante(positionAAPL)) 
##D plot(alpha_exante(portfolio),alpha_exante(positionGOOG),alpha_exante(positionAAPL),
##D legend=c('Portfolio','GOOG','AAPL'),title='Alpha')
##D print(portfolio)
##D 
##D portfolio=portfolio_create(priceDataIx=spy.data)
##D portfolio_settings(portfolio,windowLength = '3600s',resultsSamplingInterval='60s')
##D positionGOOG=position_add(portfolio,'GOOG',c(100,200),time=c(1412256601000,1412266600000),
##D priceData=goog.data) 
##D positionAAPL=position_add(portfolio,'AAPL',c(300,150),time=c(1412266600000,1412276600000),
##D priceData=aapl.data) 
##D plot(expected_return(portfolio),title="Expected Return")
##D 
##D portfolio=portfolio_create(fromTime="2014-09-01 09:00:00", toTime="2014-09-14 16:00:00")
##D portfolio_settings(portfolio,windowLength = '3600s',resultsSamplingInterval='60s')
##D positionSPY=position_add(portfolio,'SPY',500)
##D positionC=position_add(portfolio,'C',600)
##D plot(expected_return(portfolio),title="Portfolio Expected Return")
##D 
##D portfolio=portfolio_create(fromTime="2014-10-02 09:30:00", toTime="2014-10-02 16:00:00")
##D portfolio_settings(portfolio,windowLength = '3600s',resultsSamplingInterval='60s')
##D positionSPY=position_add(portfolio,'SPY',500)
##D positionC=position_add(portfolio,'C',600)
##D positionGOOG=position_add(portfolio,'GOOG',100,priceData=goog.data) 
##D position_add(portfolio,'AAPL',c(300,150),time=c(1412266600000,1412276600000),
##D priceData=aapl.data)
##D plot(expected_return(portfolio),title="Portfolio Expected Return")
##D 
##D portfolio=portfolio_create(fromTime="t-2", toTime="t")
##D portfolio_settings(portfolio,windowLength = '3600s',resultsSamplingInterval='60s')
##D positionSPY=position_add(portfolio,'SPY',500)
##D positionC=position_add(portfolio,'C',600)
##D plot(expected_return(portfolio),title="Portfolio Expected Return")
## End(Not run)


