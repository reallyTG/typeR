library(PortfolioEffectHFT)


### Name: util_plot2df
### Title: Line plot of portfolio metric (for a dataframe)
### Aliases: util_plot2df
### Keywords: PortfolioEffectHFT util_plot2df

### ** Examples

## Not run: 
##D portfolio=portfolio_create(fromTime="2014-10-02 09:30:00", toTime="2014-10-02 16:00:00")
##D portfolio_settings(portfolio,resultsSamplingInterval='60s')
##D positionSPY=position_add(portfolio,'SPY',500)
##D positionC=position_add(portfolio,'C',600)
##D metricSPY=compute(log_return(positionSPY))[[1]]
##D metricSPY=data.frame(metricSPY,legend="SPY return")
##D util_plot2df(value~time,metricSPY,title="Return, SPY")
##D 
##D metricC=compute(log_return(positionC))[[1]]
##D metricC=data.frame(metricC,legend="C return")
##D metric=rbind(metricSPY,metricC)
##D util_plot2df(value~time,metric,title="Return")
##D 
##D data(aapl.data) 
##D data(goog.data) 
##D data(spy.data) 
##D AAPLprice=data.frame(Price=aapl.data[,'Value'],time=aapl.data[,'Time'],legend='AAPL price')
##D GOOGprice=data.frame(Price=goog.data[,'Value'],time=goog.data[,'Time'],legend='GOOG price')
##D SPYprice=data.frame(Price=spy.data[,'Value'],time=spy.data[,'Time'],legend='SPY price')
##D price=rbind(AAPLprice,GOOGprice,SPYprice)
##D util_plot2df(Price~time,price,title="Stock prices")
## End(Not run)


