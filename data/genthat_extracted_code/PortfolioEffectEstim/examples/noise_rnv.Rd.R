library(PortfolioEffectEstim)


### Name: noise_rnv
### Title: Rescaled Noise Variance
### Aliases: noise_rnv
### Keywords: PortfolioEffectEstim,nonparametric, models noise_rnv

### ** Examples
 
## Not run: 
##D data(spy.data) 
##D estimator=estimator_create(priceData=spy.data)
##D estimator_settings(estimator,
##D 				   inputSamplingInterval = '10s',
##D 				   resultsSamplingInterval = '10s')
##D util_plot2d(noise_rnv(estimator),title="RNV")
## End(Not run)


