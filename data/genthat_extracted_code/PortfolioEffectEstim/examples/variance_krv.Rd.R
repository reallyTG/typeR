library(PortfolioEffectEstim)


### Name: variance_krv
### Title: Kernel Realized Variance
### Aliases: variance_krv variance_krvRolling
### Keywords: PortfolioEffectEstim,nonparametric, models variance_krv

### ** Examples
 
## Not run: 
##D data(spy.data) 
##D estimator=estimator_create(priceData=spy.data)
##D estimator_settings(estimator,
##D 				   inputSamplingInterval = '10s',
##D 				   resultsSamplingInterval = '10s')
##D util_plot2d(variance_krv(estimator,kernelName="EpanichnikovKernel"),
##D title='KRV',legend='Simple')+
##D util_line2d(variance_krvRolling(estimator,kernelName="ParzenKernel",
##D wLength=3600),legend='Rolling Window')
## End(Not run)


