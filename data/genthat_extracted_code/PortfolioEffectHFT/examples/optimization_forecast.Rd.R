library(PortfolioEffectHFT)


### Name: optimization_forecast
### Title: Porfolio Optimization - Set Optimization Forecast
### Aliases: optimization_forecast
### Keywords: PortfolioEffectHFT optimization_forecast

### ** Examples

## Not run: 
##D dateStart = "2014-11-17 09:30:00"
##D dateEnd = "2014-12-17 16:00:00"
##D portfolio=portfolio_create(dateStart,dateEnd)
##D 
##D # Add position AAPL and GOOG to portfolio
##D positionAAPL=position_add(portfolio,"AAPL",100)
##D positionGOOG=position_add(portfolio,"GOOG",200)
##D portfolio_settings(portfolio,inputSamplingInterval='30m',resultsSamplingInterval='1d')
##D 
##D forecastVarianceAAPL=forecast_builder(variance(positionAAPL),model="HAR",step ='1d')
##D forecastVarianceGOOG=forecast_builder(variance(positionGOOG),model="HAR",step ='1d')
##D 
##D optimizer=optimization_goal(variance(portfolio),"min")
##D optimizer=optimization_constraint(optimizer,log_return(portfolio),">=",0)
##D optimizer=optimization_forecast(optimizer, "Variance", forecastVarianceAAPL)
##D optimizer=optimization_forecast(optimizer, "Variance", forecastVarianceGOOG)
##D optimalPortfolioWithHAR=optimization_run(optimizer)
##D 
##D optimizer=optimization_goal(variance(portfolio),"min")
##D optimizer=optimization_constraint(optimizer,log_return(portfolio),">=",0)
##D optimalPortfolioWithoutHAR=optimization_run(optimizer)
##D 
##D plot(variance(optimalPortfolioWithHAR),variance(optimalPortfolioWithoutHAR),title="Variance",
##D legend=c("With HAR Forecast","Without HAR Forecast"))
## End(Not run)


