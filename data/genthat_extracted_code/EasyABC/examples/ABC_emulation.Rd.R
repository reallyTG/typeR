library(EasyABC)


### Name: ABC_emulation
### Title: Rejection sampling scheme for ABC using an emulator
### Aliases: ABC_emulation
### Keywords: abc model inference emulation

### ** Examples

 ## Not run: 
##D  
##D 
##D     ##### EXAMPLE 1 #####
##D     #####################
##D 
##D     ## the model is a C++ function packed into a R function -- the option 'use_seed'
##D     ##  must be turned to TRUE.
##D     trait_prior=list(c("unif",3,5),c("unif",-2.3,1.6),c("unif",-25,125),c("unif",-0.7,3.2))
##D     trait_prior
##D 
##D     ## only launching simulations with parameters drawn in the prior distributions
##D     ABC_emul = ABC_emulation(model=trait_model, prior=trait_prior,
##D       nb_design_pts=10, nb_simul=300, use_seed=TRUE, progress=TRUE)
##D     ABC_emul
##D 
##D     ## launching simulations with parameters drawn in the prior distributions and performing
##D     # the rejection step
##D     sum_stat_obs=c(100,2.5,20,30000)
##D     ABC_emul = ABC_emulation(model=trait_model, prior=trait_prior, tol=0.2, nb_design_pts=10,
##D       nb_simul=100, summary_stat_target=sum_stat_obs, use_seed=TRUE, progress=TRUE)
##D     ABC_emul
##D 
##D  
## End(Not run)



