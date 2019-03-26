library(PortfolioEffectEstim)


### Name: variance_jrmrv
### Title: Jump Robust Modulated Realized Variance
### Aliases: variance_jrmrv variance_jrmrvRolling
### Keywords: PortfolioEffectEstim,nonparametric, models variance_jrmrv

### ** Examples
 
## Not run: 
##D data(spy.data) 
##D estimator=estimator_create(priceData=spy.data)
##D estimator_settings(estimator,
##D 				   inputSamplingInterval = '10s',
##D 				   resultsSamplingInterval = '10s')
##D util_plot2d(variance_jrmrv(estimator),title='JRMRV',legend='Simple')+
##D util_line2d(variance_jrmrvRolling(estimator,wLength=3600),legend='Rolling Window')
## End(Not run)


