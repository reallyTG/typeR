library(EasyABC)


### Name: ABC_mcmc
### Title: Coupled to MCMC schemes for ABC
### Aliases: ABC_mcmc
### Keywords: abc model inference mcmc

### ** Examples

 ## Not run: 
##D  
##D     ##### EXAMPLE 1 #####
##D     #####################
##D 
##D     ## the model has two parameters and outputs two summary statistics.
##D     ## defining a simple toy model:
##D     toy_model<-function(x){ c( x[1] + x[2] + rnorm(1,0,0.1) , x[1] * x[2] + rnorm(1,0,0.1) ) }
##D 
##D     ## define prior information
##D     toy_prior=list(c("unif",0,1),c("normal",1,2))
##D     # a uniform prior distribution between 0 and 1 for parameter 1, and a normal distribution
##D     # of mean 1 and standard deviation of 2 for parameter 2.
##D 
##D     ## define the targeted summary statistics
##D     sum_stat_obs=c(1.5,0.5)
##D 
##D     ## to perform the Marjoram et al. (2003)'s method:
##D     ##
##D     ABC_Marjoram_original<-ABC_mcmc(method="Marjoram_original", model=toy_model, prior=toy_prior,
##D       summary_stat_target=sum_stat_obs)
##D     ABC_Marjoram_original
##D 
##D     ## artificial example to perform the Marjoram et al. (2003)'s method, with modifications
##D     # drawn from Wegmann et al. (2009) without Box-Cox and PLS transformations.
##D     ##
##D     ABC_Marjoram<-ABC_mcmc(method="Marjoram", model=toy_model, prior=toy_prior,
##D       summary_stat_target=sum_stat_obs)
##D     ABC_Marjoram
##D 
##D 
##D     ## artificial example to perform the Wegmann et al. (2009)'s method.
##D     ##
##D     ABC_Wegmann<-ABC_mcmc(method="Wegmann", model=toy_model, prior=toy_prior,
##D       summary_stat_target=sum_stat_obs)
##D     ABC_Wegmann
##D 
##D 
##D     ##### EXAMPLE 2 #####
##D     #####################
##D 
##D     ## this time, the model is a C++ function packed into a R function -- this time,
##D     # the option 'use_seed' must be turned to TRUE.
##D 
##D     ## define prior information
##D     trait_prior=list(c("unif",3,5),c("unif",-2.3,1.6),c("unif",-25,125),c("unif",-0.7,3.2))
##D     trait_prior
##D 
##D     ## define the targeted summary statistics
##D     sum_stat_obs=c(100,2.5,20,30000)
##D 
##D 
##D     ## artificial example to perform the Marjoram et al. (2003)'s method.
##D     ##
##D     n=10
##D     ABC_Marjoram_original<-ABC_mcmc(method="Marjoram_original", model=trait_model,
##D     prior=trait_prior, summary_stat_target=sum_stat_obs, n_rec=n, use_seed=TRUE)
##D     ABC_Marjoram_original
##D 
##D     ## artificial example to perform the Marjoram et al. (2003)'s method, with modifications
##D     # drawn from Wegmann et al. (2009) without Box-Cox and PLS transformations.
##D     ##
##D     n=10
##D     n_calib=10
##D     tol_quant=0.2 
##D     ABC_Marjoram<-ABC_mcmc(method="Marjoram", model=trait_model, prior=trait_prior,
##D       summary_stat_target=sum_stat_obs, n_rec=n, n_calibration=n_calib,
##D       tolerance_quantile=tol_quant, use_seed=TRUE)
##D     ABC_Marjoram
##D 
##D 
##D     ## artificial example to perform the Wegmann et al. (2009)'s method.
##D     ##
##D     n=10
##D     n_calib=10
##D     tol_quant=0.2 
##D     ABC_Wegmann<-ABC_mcmc(method="Wegmann", model=trait_model, prior=trait_prior,
##D         summary_stat_target=sum_stat_obs, n_rec=n, n_calibration=n_calib,
##D         tolerance_quantile=tol_quant, use_seed=TRUE)
##D     ABC_Wegmann
##D  
## End(Not run)



