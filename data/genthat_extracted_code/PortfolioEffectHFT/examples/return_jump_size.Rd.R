library(PortfolioEffectHFT)


### Name: return_jump_size
### Title: Return Jump Size
### Aliases: return_jump_size return_jump_size,position-method
### Keywords: PortfolioEffectHFT return_jump_size

### ** Examples

## Not run: 
##D dateStart = "2014-11-17 09:30:00"
##D dateEnd = "2014-11-30 16:00:00"
##D portfolio=portfolio_create(dateStart,dateEnd)
##D portfolio_settings(portfolio,portfolioMetricsMode="price",windowLength = '3600s',
##D resultsSamplingInterval='60s')
##D positionAAPL=position_add(portfolio,'AAPL',100)
##D positionC=position_add(portfolio,'C',300) 
##D positionGOOG=position_add(portfolio,'GOOG',150) 
##D result=list(return_jump_size(positionC),return_jump_size(positionGOOG),
##D return_jump_size(positionAAPL))
## End(Not run)


