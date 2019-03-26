library(PortfolioEffectEstim)


### Name: estimator_settings
### Title: Estimator Settings
### Aliases: estimator_settings
### Keywords: PortfolioEffectEstim,nonparametric, models estimator_settings

### ** Examples

## Not run: 
##D data(spy.data) 
##D estimator=estimator_create(priceData=spy.data)
##D estimator_settings(estimator,
##D 				   inputSamplingInterval = '10s',
##D 				   resultsSamplingInterval = '10s')
##D util_plot2d(variance_mrv(estimator),title="MRV")
##D 				   
##D dateStart = "2014-11-17 09:30:00"
##D dateEnd = "2014-11-17 16:00:00"
##D estimator=estimator_create('AAPL',dateStart,dateEnd)
##D estimator_settings(estimator,
##D 				   resultsSamplingInterval = '10s')
##D util_plot2d(variance_mrv(estimator),title="MRV")
## End(Not run)


