library(PortfolioEffectEstim)


### Name: variance_rv
### Title: Realized Variance
### Aliases: variance_rv variance_rvRolling
### Keywords: PortfolioEffectEstim,nonparametric, models variance_rv

### ** Examples
 
## Not run: 
##D data(spy.data) 
##D estimator=estimator_create(priceData=spy.data)
##D estimator_settings(estimator,
##D 				   inputSamplingInterval = '10s',
##D 				   resultsSamplingInterval = '10s')
##D util_plot2d(variance_rv(estimator),title='RV',legend='Simple')+
##D util_line2d(variance_rvRolling(estimator,wLength=3600),legend='Rolling Window')
## End(Not run)


