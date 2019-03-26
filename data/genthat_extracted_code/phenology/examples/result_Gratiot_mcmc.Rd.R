library(phenology)


### Name: result_Gratiot_mcmc
### Title: Result of the mcmc for Leatherback nest counts
### Aliases: result_Gratiot_mcmc
### Keywords: datasets

### ** Examples

## Not run: 
##D library(phenology)
##D data(result_Gratiot)
##D # Read a file with data
##D data(Gratiot)
##D # Generate a formatted list nammed data_Gratiot 
##D data_Gratiot <- add_phenology(Gratiot, name="Complete", 
##D 		reference=as.Date("2001-01-01"), format="%d/%m/%Y")
##D # Generate initial points for the optimisation
##D parg <- par_init(data_Gratiot, fixed.parameters=NULL)
##D # Run the optimisation
##D result_Gratiot <- fit_phenology(data=data_Gratiot, 
##D 		fitted.parameters=parg, fixed.parameters=NULL)
##D # generate data for mcmc run
##D pmcmc <- phenology_MHmcmc_p(result_Gratiot, accept = TRUE)
##D result_Gratiot_mcmc <- phenology_MHmcmc(result = result_Gratiot, 
##D      n.iter = 10000, 
##D      adaptive=TRUE,
##D      parametersMCMC = pmcmc, 
##D      n.chains = 1, n.adapt = 0, thin = 1, trace = FALSE)
##D # Read a file with result
##D data(result_Gratiot_mcmc)
##D 1-rejectionRate(as.mcmc(result_Gratiot_mcmc))
##D 
##D summary(result_Gratiot, resultmcmc=result_Gratiot_mcmc)
## End(Not run)



