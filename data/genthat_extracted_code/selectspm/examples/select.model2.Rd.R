library(selectspm)


### Name: select.model2
### Title: Fit and Select Point Pattern Models Based on Minimum Contrast
###   and AIC
### Aliases: select.model2 aic.function ipc.estK2 envelope.selectedmod
###   simulate.selectedmod plot.selectedmod print.selectedmod
### Keywords: spatial

### ** Examples

## Not run: 
##D # Get the data
##D data(lansing)
##D 
##D # Split the multivariate pp in their individual components
##D lansing.sp<-split(lansing)
##D 
##D # Define the sequence of r's at which estimate K(r)
##D r<-  seq(0,0.25,le=101)
##D 
##D # Define different standard deviations for the Gaussian kernel 
##D # to estimate different intensity surfaces
##D sigmas<- seq(0.1,1,by=0.05)
##D 
##D # Note that lansing is defined in a (0,1) x (0,1) window and this affects
##D # the election of r and sigma values
##D 
##D # Fit 40 models (1 Poisson, 1 Poisson cluster, 19 inhomogeneous Poisson
##D #  and 19 inhomogeneous Poisson cluster)  to maple and select the better ones
##D maple.model <- select.model2(lansing.sp$maple, sigmas=sigmas, r=r)
##D # show the AICc value and the fitted parameters for the best model in each class
##D maple.model
##D 
##D # Draw the empirical and theoretical models to visually asses the fitting.
##D # P = Poisson; HPP= heterogeneous (i.e. inhomogeneous) Poisson;
##D # PC = Poisson cluster; HPC=heterogeneous (i.e. inhomogeneous) Poisson cluster
##D plot(maple.model)
##D 
##D # Compute and plot envelopes for the K function according to the best fitted model.
##D maple.env <- envelope(maple.model, nsim=19)
##D plot(maple.env, sqrt(./pi)-r~r, legend=F)
##D 
##D # simulate 10 point patterns according to the best fitted model
##D 
##D maple.simu <- simulate(maple.model, nsim=10)
##D 
##D maple.simu
##D 
##D # FIt and select models to all species
##D lansing.models<-lapply(lansing.sp, function(x) select.model2(x, sigmas=sigmas, r=r))
##D lapply(lansing.models, function(x) x)
## End(Not run)



