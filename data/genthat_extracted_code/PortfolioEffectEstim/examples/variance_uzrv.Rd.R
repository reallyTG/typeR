library(PortfolioEffectEstim)


### Name: variance_uzrv
### Title: Uncertainty Zones Realized Variance
### Aliases: variance_uzrv
### Keywords: PortfolioEffectEstim,nonparametric, models variance_uzrv

### ** Examples
 
## Not run: 
##D data(spy.data) 
##D estimator=estimator_create(priceData=spy.data)
##D estimator_settings(estimator,
##D 				   inputSamplingInterval = '10s',
##D 				   resultsSamplingInterval = '10s')
##D util_plot2d(variance_uzrv(estimator),title="UZRV")
## End(Not run)


