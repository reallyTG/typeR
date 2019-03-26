library(PortfolioEffectHFT)


### Name: optimization_run
### Title: Portfolio Optimization - Runs Optimization Algorithm
### Aliases: optimization_run
### Keywords: PortfolioEffectHFT optimization_run

### ** Examples

## Not run: 
##D dateStart = "2014-11-17 09:30:00"
##D dateEnd = "2014-11-17 16:00:00"
##D portfolio=portfolio_create(dateStart,dateEnd)
##D portfolio_settings(portfolio,portfolioMetricsMode="price",windowLength = '3600s',
##D resultsSamplingInterval='60s')
##D positionAAPL=position_add(portfolio,'AAPL',100)
##D positionC=position_add(portfolio,'C',300) 
##D optimizer=optimization_goal(log_return(portfolio),"max")
##D optimizer=optimization_constraint(optimizer,beta(portfolio),"<=",0.5)
##D optimization_run(optimizer)
## End(Not run)


