library(EasyABC)


### Name: ABC_sequential
### Title: Sequential sampling schemes for ABC
### Aliases: ABC_sequential
### Keywords: abc model inference sequential_monte_carlo
###   population_monte_carlo

### ** Examples

 ## Not run: 
##D  
##D     ##### EXAMPLE 1 #####
##D     #####################
##D     set.seed(1)
##D 
##D     ## artificial example to show how to use the 'ABC_sequential' function.
##D     ## defining a simple toy model:
##D     toy_model<-function(x){ 2 * x + 5 + rnorm(1,0,0.1) }
##D 
##D     ## define prior information
##D     toy_prior=list(c("unif",0,1)) # a uniform prior distribution between 0 and 1
##D 
##D     ## define the targeted summary statistics
##D     sum_stat_obs=6.5
##D 
##D     ## to perform the Beaumont et al. (2009)'s method:
##D     ##
##D     tolerance=c(1.5,0.5)
##D     ABC_Beaumont<-ABC_sequential(method="Beaumont", model=toy_model, prior=toy_prior,
##D     nb_simul=20, summary_stat_target=sum_stat_obs, tolerance_tab=tolerance)
##D     ABC_Beaumont
##D 
##D     ## to perform the Drovandi and Pettitt (2011)'s method:
##D     ##
##D     tolerance=0.5
##D     c_drov=0.7
##D     ABC_Drovandi<-ABC_sequential(method="Drovandi", model=toy_model, prior=toy_prior,
##D     nb_simul=20, summary_stat_target=sum_stat_obs, tolerance_tab=tolerance, c=c_drov)
##D     ABC_Drovandi
##D 
##D     ## to perform the Del Moral et al. (2012)'s method:
##D     ##
##D     alpha_delmo=0.5
##D     tolerance=0.5
##D     ABC_Delmoral<-ABC_sequential(method="Delmoral", model=toy_model, prior=toy_prior,
##D     nb_simul=20, summary_stat_target=sum_stat_obs, alpha=alpha_delmo, tolerance_target=tolerance)
##D     ABC_Delmoral
##D 
##D     ## to perform the Lenormand et al. (2012)'s method:
##D     ##
##D     pacc=0.4
##D     ABC_Lenormand<-ABC_sequential(method="Lenormand", model=toy_model, prior=toy_prior,
##D     nb_simul=20, summary_stat_target=sum_stat_obs, p_acc_min=pacc)
##D     ABC_Lenormand
##D 
##D 
##D     ##### EXAMPLE 2 #####
##D     #####################
##D 
##D     ## this time, the model has two parameters and outputs two summary statistics.
##D     ## defining a simple toy model:
##D     toy_model2<-function(x){ c( x[1] + x[2] + rnorm(1,0,0.1) , x[1] * x[2] + rnorm(1,0,0.1) ) }
##D 
##D     ## define prior information
##D     toy_prior2=list(c("unif",0,1),c("normal",1,2))
##D     # a uniform prior distribution between 0 and 1 for parameter 1, and a normal distribution
##D     # of mean 1 and standard deviation of 2 for parameter 2.
##D 
##D     ## define the targeted summary statistics
##D     sum_stat_obs2=c(1.5,0.5)
##D 
##D     ## to perform the Beaumont et al. (2009)'s method:
##D     ##
##D     tolerance=c(1.5,0.5)
##D     ABC_Beaumont<-ABC_sequential(method="Beaumont", model=toy_model2, prior=toy_prior2,
##D     nb_simul=20, summary_stat_target=sum_stat_obs2, tolerance_tab=tolerance)
##D     ABC_Beaumont
##D 
##D     ## to perform the Drovandi and Pettitt (2011)'s method:
##D     ##
##D     tolerance=0.5
##D     c_drov=0.7
##D     ABC_Drovandi<-ABC_sequential(method="Drovandi", model=toy_model2, prior=toy_prior2,
##D     nb_simul=20, summary_stat_target=sum_stat_obs2, tolerance_tab=tolerance, c=c_drov)
##D     ABC_Drovandi
##D 
##D     ## to perform the Del Moral et al. (2012)'s method:
##D     ##
##D     alpha_delmo=0.5
##D     tolerance=0.5
##D     ABC_Delmoral<-ABC_sequential(method="Delmoral", model=toy_model2, prior=toy_prior2,
##D     nb_simul=20, summary_stat_target=sum_stat_obs2, alpha=alpha_delmo, tolerance_target=tolerance)
##D     ABC_Delmoral
##D 
##D     ## to perform the Lenormand et al. (2012)'s method:
##D     ##
##D     pacc=0.4
##D     # Only uniform priors are supported for the method "Lenormand" (since it performs a Latin
##D     # Hypercube sampling at the beginning):
##D     toy_prior2=list(c("unif",0,1),c("unif",0.5,1.5))
##D     # a uniform prior distribution between 0 and 1 for parameter 1, and a normal distribution of
##D     # mean 1 and standard deviation of 1 for parameter 2.
##D     ABC_Lenormand<-ABC_sequential(method="Lenormand", model=toy_model2, prior=toy_prior2,
##D     nb_simul=20, summary_stat_target=sum_stat_obs2, p_acc_min=pacc)
##D     ABC_Lenormand
##D 
##D     ##### EXAMPLE 3 #####
##D     #####################
##D 
##D     ## this time, the model is a C++ function packed into a R function -- this time, the option
##D     # 'use_seed' must be turned to TRUE.
##D     n=10
##D     ## define prior information
##D     trait_prior=list(c("unif",3,5),c("unif",-2.3,1.6),c("unif",-25,125),c("unif",-0.7,3.2))
##D     trait_prior
##D 
##D     ## define the targeted summary statistics
##D     sum_stat_obs=c(100,2.5,20,30000)
##D 
##D     ## to perform the Beaumont et al. (2009)'s method:
##D     ##
##D     tolerance=c(8,5)
##D     ABC_Beaumont<-ABC_sequential(method="Beaumont", model=trait_model, prior=trait_prior,
##D     nb_simul=20, summary_stat_target=sum_stat_obs, tolerance_tab=tolerance, use_seed=TRUE)
##D     ABC_Beaumont
##D 
##D     ## to perform the Drovandi and Pettitt (2011)'s method:
##D     ##
##D     tolerance=3
##D     c_drov=0.7
##D     ABC_Drovandi<-ABC_sequential(method="Drovandi", model=trait_model, prior=trait_prior,
##D       nb_simul=20, summary_stat_target=sum_stat_obs, tolerance_tab=tolerance, c=c_drov,
##D       use_seed=TRUE)
##D     ABC_Drovandi
##D 
##D     ## to perform the Del Moral et al. (2012)'s method:
##D     ##
##D     alpha_delmo=0.5
##D     tolerance=3
##D     ABC_Delmoral<-ABC_sequential(method="Delmoral", model=trait_model, prior=trait_prior,
##D       nb_simul=20, summary_stat_target=sum_stat_obs, alpha=alpha_delmo,
##D       tolerance_target=tolerance, use_seed=TRUE)
##D     ABC_Delmoral
##D 
##D     ## to perform the Lenormand et al. (2012)'s method:
##D     ##
##D     pacc=0.4
##D     ABC_Lenormand<-ABC_sequential(method="Lenormand", model=trait_model, prior=trait_prior,
##D       nb_simul=20, summary_stat_target=sum_stat_obs, p_acc_min=pacc, use_seed=TRUE)
##D     ABC_Lenormand
##D 
##D 
##D     ##### EXAMPLE 4 - Parallel implementations #####
##D     ################################################
##D 
##D     ## NB: the option use_seed must be turned to TRUE.
##D 
##D     ## For models already running with the option use_seed=TRUE, simply change
##D     # the value of n_cluster:
##D     sum_stat_obs=c(100,2.5,20,30000)
##D     ABC_Lenormand<-ABC_sequential(method="Lenormand", model=trait_model, prior=trait_prior,
##D     nb_simul=20, summary_stat_target=sum_stat_obs, p_acc_min=pacc, use_seed=TRUE, n_cluster=2)
##D     ABC_Lenormand
##D 
##D     ## For other models, change the value of n_cluster and modify the model so that the
##D     # first parameter becomes a seed information value:
##D     toy_model_parallel<-function(x){ 
##D 	set.seed(x[1])
##D 	2 * x[2] + 5 + rnorm(1,0,0.1) }
##D     sum_stat_obs=6.5
##D 
##D     ABC_Lenormand<-ABC_sequential(method="Lenormand", model=toy_model_parallel, prior=toy_prior,
##D     nb_simul=20, summary_stat_target=sum_stat_obs, p_acc_min=pacc, use_seed=TRUE, n_cluster=2)
##D     ABC_Lenormand
##D  
## End(Not run)



