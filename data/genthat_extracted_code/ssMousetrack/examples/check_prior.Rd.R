library(ssMousetrack)


### Name: check_prior
### Title: Check prior distributions
### Aliases: check_prior

### ** Examples


## Not run: 
##D ## Define priors for all the paramaters 
##D priors_list <- list("lognormal(1,1)","normal(2,3)T(0,10)","normal(3,1)")
##D priors_out <- check_prior(priors_list)
##D print(priors_out)
##D 
##D ## Define priors for some of the paramaters 
##D priors_list <- list(NULL,"pareto(1,1.2)",NULL)
##D priors_out <- check_prior(priors_list)
##D print(priors_out)
##D 
##D ## Use pre-defined vague priors for all the parameters
##D priors_list <- list(NULL,NULL,NULL)
##D priors_out <- check_prior(priors_list)
##D print(priors_out)
## End(Not run)



