library(PortfolioEffectEstim)


### Name: noise_urnv
### Title: Unbiased Rescaled Noise Variance
### Aliases: noise_urnv
### Keywords: PortfolioEffectEstim,nonparametric, models noise_urnv

### ** Examples
 
## Not run: 
##D data(spy.data) 
##D estimator=estimator_create(priceData=spy.data)
##D estimator_settings(estimator,
##D 				   inputSamplingInterval = '10s',
##D 				   resultsSamplingInterval = '10s')
##D util_plot2d(noise_urnv(estimator),title="URNV")
## End(Not run)


