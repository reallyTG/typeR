library(phenology)


### Name: phenology_MHmcmc_p
### Title: Generates set of parameters to be used with phenology_MHmcmc()
### Aliases: phenology_MHmcmc_p

### ** Examples

## Not run: 
##D library(phenology)
##D data(Gratiot)
##D # Generate a formatted list named data_Gratiot 
##D data_Gratiot<-add_phenology(Gratiot, name="Complete", 
##D   	reference=as.Date("2001-01-01"), format="%d/%m/%Y")
##D # Generate initial points for the optimisation
##D parg<-par_init(data_Gratiot, fixed.parameters=NULL)
##D # Run the optimisation
##D result_Gratiot<-fit_phenology(data=data_Gratiot, 
##D 		fitted.parameters=parg, fixed.parameters=NULL)
##D # Generate set of priors for Bayesian analysis
##D pmcmc <- phenology_MHmcmc_p(result_Gratiot, accept = TRUE)
##D result_Gratiot_mcmc <- phenology_MHmcmc(result = result_Gratiot, n.iter = 10000, 
##D parametersMCMC = pmcmc, n.chains = 1, n.adapt = 0, thin = 1, trace = FALSE)
##D # Get standard error of parameters
##D summary(result_Gratiot_mcmc)
##D # Make diagnostics of the mcmc results using coda package
##D mcmc <- as.mcmc(result_Gratiot_mcmc)
##D require(coda)
##D heidel.diag(mcmc)
##D raftery.diag(mcmc)
##D autocorr.diag(mcmc)
##D acf(mcmc[[1]][,"LengthB"], lag.max=200, bty="n", las=1)
##D acf(mcmc[[1]][,"Max_Gratiot"], lag.max=50, bty="n", las=1)
##D batchSE(mcmc, batchSize=100)
##D # The batch standard error procedure is usually thought to 
##D # be not as accurate as the time series methods used in summary
##D summary(mcmc)$statistics[,"Time-series SE"]
##D plot(result_Gratiot_mcmc, parameters=3, las=1, xlim=c(-10, 300))
## End(Not run)



