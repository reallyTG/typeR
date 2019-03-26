library(PortfolioEffectEstim)


### Name: noise_acnv
### Title: Autocovariance Noise Variance
### Aliases: noise_acnv
### Keywords: PortfolioEffectEstim,nonparametric, models noise_acnv

### ** Examples
 
## Not run: 
##D data(spy.data) 
##D estimator=estimator_create(priceData=spy.data)
##D estimator_settings(estimator,
##D 				   inputSamplingInterval = '10s',
##D 				   resultsSamplingInterval = '10s')
##D util_plot2d(noise_acnv(estimator),title="ACNV")
## End(Not run)


