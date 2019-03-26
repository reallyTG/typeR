library(PortfolioEffectEstim)


### Name: noise_nts
### Title: Noise to Signal Ratio
### Aliases: noise_nts
### Keywords: PortfolioEffectEstim,nonparametric, models noise_nts

### ** Examples
 
## Not run: 
##D data(spy.data) 
##D estimator=estimator_create(priceData=spy.data)
##D estimator_settings(estimator,
##D 				   inputSamplingInterval = '10s',
##D 				   resultsSamplingInterval = '10s')
##D util_plot2d(noise_nts(estimator),title="NTS")
## End(Not run)


