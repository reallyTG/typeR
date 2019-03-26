library(PortfolioEffectHFT)


### Name: portfolio_getSettings
### Title: Get Portfolio Settings
### Aliases: portfolio_getSettings
### Keywords: PortfolioEffectHFT portfolio_getSettings

### ** Examples

## Not run: 
##D dateStart = "2014-11-17 09:30:00"
##D dateEnd = "2014-11-17 16:00:00"
##D portfolio=portfolio_create(dateStart,dateEnd)
##D positionAAPL=position_add(portfolio,'AAPL',100)
##D positionC=position_add(portfolio,'C',300) 
##D positionGOOG=position_add(portfolio,'GOOG',150) 
##D portfolio_settings(portfolio,
##D 				   windowLength='600s',
##D 				   resultsSamplingInterval = '10s')
##D settings=portfolio_getSettings(portfolio)
##D settings
## End(Not run)


