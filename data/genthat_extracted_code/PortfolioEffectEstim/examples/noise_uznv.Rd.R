library(PortfolioEffectEstim)


### Name: noise_uznv
### Title: Uncertainty Zones Noise Variance
### Aliases: noise_uznv
### Keywords: PortfolioEffectEstim,nonparametric, models noise_uznv

### ** Examples
 
## Not run: 
##D data(spy.data) 
##D estimator=estimator_create(priceData=spy.data)
##D estimator_settings(estimator,
##D 				   inputSamplingInterval = '10s',
##D 				   resultsSamplingInterval = '10s')
##D util_plot2d(noise_uznv(estimator),title="UZNV")
## End(Not run)


