library(PortfolioEffectHFT)


### Name: portfolio_getPosition
### Title: Get position from portfolio
### Aliases: portfolio_getPosition
### Keywords: PortfolioEffectHFT portfolio_getPosition

### ** Examples

## Not run: 
##D dateStart = "2014-11-17 09:30:00"
##D dateEnd = "2014-11-17 16:00:00"
##D portfolio=portfolio_create(dateStart,dateEnd)
##D portfolio_settings(portfolio,portfolioMetricsMode="price",windowLength = '3600s',
##D resultsSamplingInterval='60s')
##D positionAAPL=position_add(portfolio,'AAPL',100)
##D positionC=position_add(portfolio,'C',300) 
##D position_add(portfolio,'GOOG',150)
##D positionGOOG=portfolio_getPosition(portfolio,'GOOG')
## End(Not run)


