library(embryogrowth)


### Name: resultNest_mcmc_4p_SSM4p
### Title: Result of the mcmc using the nest database
### Aliases: resultNest_mcmc_4p_SSM4p
### Keywords: datasets

### ** Examples

## Not run: 
##D library(embryogrowth)
##D data(nest)
##D formated <- FormatNests(nest)
##D # The initial parameters value can be:
##D # "T12H", "DHA",  "DHH", "Rho25"
##D # Or
##D # "T12L", "DT", "DHA",  "DHH", "DHL", "Rho25"
##D x <- structure(c(118.431040984352, 498.205702157603, 306.056280989839, 
##D 118.189669472381), .Names = c("DHA", "DHH", "T12H", "Rho25"))
##D # pfixed <- c(K=82.33) or rK=82.33/39.33
##D pfixed <- c(rK=2.093313)
##D resultNest_4p_SSM4p <- searchR(parameters=x, fixed.parameters=pfixed, 
##D 	temperatures=formated, derivate=dydt.Gompertz, M0=1.7, 
##D 	test=c(Mean=39.33, SD=1.92))
##D data(resultNest_4p_SSM4p)
##D pMCMC <- TRN_MHmcmc_p(resultNest_4p_SSM4p, accept=TRUE)
##D # Take care, it can be very long, sometimes several days
##D resultNest_mcmc_4p_SSM4p <- GRTRN_MHmcmc(result=resultNest_4p_SSM4p, 
##D  adaptive = TRUE, 
##D 	parametersMCMC=pMCMC, n.iter=10000, n.chains = 1, n.adapt = 0,  
##D 	thin=1, trace=TRUE)
##D data(resultNest_mcmc_4p_SSM4p)
##D 1-rejectionRate(as.mcmc(resultNest_mcmc_4p_SSM4p))
##D as.parameters(resultNest_mcmc_4p_SSM4p)
##D layout(mat=matrix(1:4, nrow = 2))
##D plot(resultNest_mcmc_4p_SSM4p, parameters = "all", scale.prior = TRUE, las = 1)
##D layout(mat=1)
##D plotR(resultNest_4p_SSM4p, resultmcmc=resultNest_mcmc_4p_SSM4p, ylim=c(0,4), 
##D          main="Schoolfield, Sharpe & Magnuson 4-parameters", show.density=TRUE)
## End(Not run)



