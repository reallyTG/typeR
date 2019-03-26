library(EasyABC)


### Name: ABC_rejection
### Title: Rejection sampling scheme for ABC
### Aliases: ABC_rejection
### Keywords: abc model inference

### ** Examples

    ##### EXAMPLE 1 #####
    #####################
    set.seed(1)

    ## artificial example to show how to use the 'ABC_rejection' function.
    ## defining a simple toy model:
    toy_model<-function(x){ 2 * x + 5 + rnorm(1,0,0.1) }

    ## define prior information
    toy_prior=list(c("unif",0,1)) # a uniform prior distribution between 0 and 1

    ## only launching simulations with parameters drawn in the prior distributions
    set.seed(1)
    n=10
    ABC_sim<-ABC_rejection(model=toy_model, prior=toy_prior, nb_simul=n)
    ABC_sim

    ## launching simulations with parameters drawn in the prior distributions
    # and performing the rejection step
    sum_stat_obs=6.5
    tolerance=0.2
    ABC_rej<-ABC_rejection(model=toy_model, prior=toy_prior, nb_simul=n,
      summary_stat_target=sum_stat_obs, tol=tolerance)

    ## NB: see the package's vignette to see how to pipeline 'ABC_rejection' with the function
    # 'abc' of the package 'abc' to perform other rejection schemes.
 ## Not run: 
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
##D     ## only launching simulations with parameters drawn in the prior distributions
##D     set.seed(1)
##D     n=10
##D     ABC_sim<-ABC_rejection(model=toy_model2, prior=toy_prior2, nb_simul=n)
##D     ABC_sim
##D 
##D     ## launching simulations with parameters drawn in the prior distributions
##D     # and performing the rejection step
##D     sum_stat_obs2=c(1.5,0.5)
##D     tolerance=0.2
##D     ABC_rej<-ABC_rejection(model=toy_model2, prior=toy_prior2, nb_simul=n,
##D       summary_stat_target=sum_stat_obs2, tol=tolerance)
##D 
##D     ## NB: see the package's vignette to see how to pipeline 'ABC_rejection' with the function
##D     # 'abc' of the package 'abc' to perform other rejection schemes.
##D 
##D 
##D     ##### EXAMPLE 3 #####
##D     #####################
##D 
##D     ## this time, the model is a C++ function packed into a R function -- this time, the option
##D     # 'use_seed' must be turned to TRUE.
##D     n=10
##D     trait_prior=list(c("unif",3,5),c("unif",-2.3,1.6),c("unif",-25,125),c("unif",-0.7,3.2))
##D     trait_prior
##D 
##D     ## only launching simulations with parameters drawn in the prior distributions
##D     ABC_sim<-ABC_rejection(model=trait_model, prior=trait_prior, nb_simul=n, use_seed=TRUE)
##D     ABC_sim
##D 
##D     ## launching simulations with parameters drawn in the prior distributions and performing
##D     # the rejection step
##D     sum_stat_obs=c(100,2.5,20,30000)
##D     tolerance=0.2
##D     ABC_rej<-ABC_rejection(model=trait_model, prior=trait_prior, nb_simul=n,
##D       summary_stat_target=sum_stat_obs, tol=tolerance, use_seed=TRUE)
##D 
##D     ## NB: see the package's vignette to see how to pipeline 'ABC_rejection' with the function
##D     # 'abc' of the package 'abc' to perform other rejection schemes.
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
##D     ABC_simb<-ABC_rejection(model=trait_model, prior=trait_prior, nb_simul=n,
##D       use_seed=TRUE, n_cluster=2)
##D 
##D     ## For other models, change the value of n_cluster and modify the model so that the first
##D     # parameter becomes a seed information value:
##D     toy_model_parallel<-function(x){ 
##D 	set.seed(x[1])
##D 	2 * x[2] + 5 + rnorm(1,0,0.1) }
##D     sum_stat_obs=6.5
##D 
##D     ABC_simb<-ABC_rejection(model=toy_model_parallel, prior=toy_prior, nb_simul=n,
##D       use_seed=TRUE, n_cluster=2)
##D  
## End(Not run)



