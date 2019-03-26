library(PortfolioEffectHFT)


### Name: optimization_goal
### Title: Porfolio Optimization - Set Optimization Goal
### Aliases: optimization_goal
### Keywords: PortfolioEffectHFT optimization_goal

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
##D optimalPortfolio=optimization_run(optimizer)
##D print(optimalPortfolio)
## End(Not run)


