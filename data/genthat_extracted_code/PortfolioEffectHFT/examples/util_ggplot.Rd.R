library(PortfolioEffectHFT)


### Name: util_ggplot
### Title: Converter of portfolioPlot to ggplot2
### Aliases: util_ggplot
### Keywords: PortfolioEffectHFT util_ggplot

### ** Examples

## Not run: 
##D dateStart = "2014-11-17 09:30:00"
##D dateEnd = "2014-11-17 16:00:00"
##D portfolio=portfolio_create(dateStart,dateEnd)
##D portfolio_settings(portfolio,portfolioMetricsMode="price",windowLength = '3600s',
##D resultsSamplingInterval='60s')
##D positionAAPL=position_add(portfolio,'AAPL',100)
##D positionC=position_add(portfolio,'C',300) 
##D plot1=util_ggplot(plot(weight(positionAAPL),title="AAPL Weight"))
##D plot2=util_ggplot(plot(weight(positionC),title="C Weight"))
##D util_multiplot(plot1,plot2,cols=1)
## End(Not run)


