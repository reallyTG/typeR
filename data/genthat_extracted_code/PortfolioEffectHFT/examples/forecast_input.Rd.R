library(PortfolioEffectHFT)


### Name: forecast_input
### Title: Forecast Input
### Aliases: forecast_input
### Keywords: PortfolioEffectHFT forecast_input

### ** Examples

## Not run: 
##D dateStart = "2014-11-17 09:30:00"
##D dateEnd = "2014-11-17 16:00:00"
##D portfolio=portfolio_create(dateStart,dateEnd)
##D portfolio_settings(portfolio,portfolioMetricsMode="price",windowLength = '360s',
##D                    resultsSamplingInterval='60s')
##D positionAAPL=position_add(portfolio,'AAPL',100)
##D positionC=position_add(portfolio,'C',300) 
##D positionGOOG=position_add(portfolio,'GOOG',150) 
##D 
##D forecastVariance_1=forecast_builder(variance(positionAAPL),window="1d")
##D # plot(forecast_apply(forecastVariance),variance(positionAAPL),legend=c('Forecast','Simple'))
##D 
##D forecastVariance_2=forecast_builder(variance(positionAAPL),window="1d")
##D forecastVariance_2=forecast_input(forecastVariance_2,beta(positionAAPL))
##D plot(forecast_apply(forecastVariance_1),forecast_apply(forecastVariance_2),
##D      variance(positionAAPL),legend=c('Forecast,without input','Forecast,with input','Simple'))
## End(Not run)


