library(PortfolioEffectEstim)


### Name: variance_mrv
### Title: Modulated Realized Variance
### Aliases: variance_mrv variance_mrvRolling
### Keywords: PortfolioEffectEstim,nonparametric, models variance_mrv

### ** Examples
 
## Not run: 
##D data(spy.data) 
##D estimator=estimator_create(priceData=spy.data)
##D estimator_settings(estimator,
##D 				   inputSamplingInterval = '10s',
##D 				   resultsSamplingInterval = '10s')
##D util_plot2d(variance_mrv(estimator),title='MRV',legend='Simple')+
##D util_line2d(variance_mrvRolling(estimator,wLength=3600),legend='Rolling Window')
## End(Not run)


