library(DPP)


### Name: dppMCMC_C
### Title: A Reference Class that provides DPP functionality
### Aliases: dppMCMC_C

### ** Examples

normal.model<-new(NormalModel,
                 mean_prior_mean=0.5,
                 mean_prior_sd=0.1,
                 sd_prior_shape=3,
                 sd_prior_rate=20,
                 estimate_concentration_parameter=TRUE,
                 concentration_parameter_alpha=10,
                  proposal_disturbance_sd=0.1)

#simulating three normal distributions
y <- c(rnorm(100,mean=0.2,sd=0.05), rnorm(100,0.7,0.05), rnorm(100,1.3,0.1))
hist(y,breaks=30)

#setwd("~/yourwd") #mcmc log files will be saved here
## Not run: 
##D my_dpp_analysis <- dppMCMC_C(data=y,
##D                              output = "output_prefix_",
##D                              model=normal.model,
##D                              num_auxiliary_tables=4,
##D                              expected_k=1.5,
##D                              power=1)
##D #running the mcmc  , generations will be ignored because auto_stop=true
##D my_dpp_analysis$run(generations=1000,auto_stop=TRUE,max_gen = 10000,min_ess = 500)
##D 
##D #we get rid of the first 25% of the output (burn-in)
##D hist(my_dpp_analysis$getNumCategoryTrace(0.25))
##D 
##D my_dpp_analysis$getNumCategoryProbabilities(0.25)
## End(Not run)




