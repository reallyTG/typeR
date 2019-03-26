library(PortfolioEffectHFT)


### Name: information_ratio
### Title: Information Ratio
### Aliases: information_ratio information_ratio,portfolio-method
###   information_ratio,position-method
### Keywords: PortfolioEffectHFT information_ratio

### ** Examples

## Not run: 
##D dateStart = "2014-11-17 09:30:00"
##D dateEnd = "2014-11-17 16:00:00"
##D portfolio=portfolio_create(dateStart,dateEnd)
##D portfolio_settings(portfolio,portfolioMetricsMode="price",windowLength = '3600s',
##D resultsSamplingInterval='60s')
##D positionAAPL=position_add(portfolio,'AAPL',100)
##D positionC=position_add(portfolio,'C',300) 
##D positionGOOG=position_add(portfolio,'GOOG',150) 
##D result=compute(information_ratio(positionC),information_ratio(positionGOOG),
##D information_ratio(positionAAPL)) 
##D plot(information_ratio(positionC),information_ratio(positionGOOG),
##D information_ratio(positionAAPL),legend=c('C','GOOG','AAPL'),title='Information Ratio')
## End(Not run)


