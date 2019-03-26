library(embryogrowth)


### Name: GRTRN_MHmcmc
### Title: Metropolis-Hastings algorithm for Embryo Growth Rate Thermal
###   Reaction Norm
### Aliases: GRTRN_MHmcmc

### ** Examples

## Not run: 
##D library(embryogrowth)
##D data(nest)
##D formated <- FormatNests(nest)
##D # The initial parameters value can be:
##D # "T12H", "DHA",  "DHH", "Rho25"
##D # Or
##D # "T12L", "T12H", "DHA",  "DHH", "DHL", "Rho25"
##D x <- structure(c(118.768297442004, 475.750095909406, 306.243694918151, 
##D 116.055824800264), .Names = c("DHA", "DHH", "T12H", "Rho25"))
##D # pfixed <- c(K=82.33) or rK=82.33/39.33
##D pfixed <- c(rK=2.093313)
##D resultNest_4p_SSM4p <- searchR(parameters=x, fixed.parameters=pfixed,  
##D 	temperatures=formated, derivate=dydt.Gompertz, M0=1.7,  
##D 	test=c(Mean=39.33, SD=1.92))
##D data(resultNest_4p_SSM4p)
##D pMCMC <- TRN_MHmcmc_p(resultNest_4p_SSM4p, accept=TRUE)
##D # Take care, it can be very long; several days
##D resultNest_mcmc_4p_SSM4p <- GRTRN_MHmcmc(result=resultNest_4p_SSM4p, 
##D    adaptive = TRUE,
##D 		parametersMCMC=pMCMC, n.iter=10000, n.chains = 1,  
##D 		n.adapt = 0, thin=1, trace=TRUE)
##D data(resultNest_mcmc_4p_SSM4p)
##D out <- as.mcmc(resultNest_mcmc_4p_SSM4p)
##D # This out can be used with coda package
##D # Test for stationarity and length of chain
##D require(coda)
##D heidel.diag(out)
##D raftery.diag(out)
##D # plot() can use the direct output of GRTRN_MHmcmc() function.
##D plot(resultNest_mcmc_4p_SSM4p, parameters=1, xlim=c(0,550))
##D plot(resultNest_mcmc_4p_SSM4p, parameters=3, xlim=c(290,320))
##D # summary() permits to get rapidly the standard errors for parameters
##D # They are store in the result also.
##D se <- result_mcmc_4p_SSM4p$SD
##D # the confidence interval is better estimated by:
##D apply(out[[1]], 2, quantile, probs=c(0.025, 0.975))
##D # The use of the intermediate method is as followed;
##D # Here the total mcmc iteration is 10000, but every 1000, intermediate
##D # results are saved in file intermediate1000.Rdata:
##D resultNest_mcmc_4p_SSM4p <- GRTRN_MHmcmc(result=resultNest_4p_SSM4p, 
##D parametersMCMC=pMCMC, n.iter=10000, n.chains = 1,  
##D n.adapt = 0, thin=1, trace=TRUE, 
##D intermediate=1000, filename="intermediate1000.Rdata")
##D # If run has been stopped for any reason, it can be resumed with:
##D resultNest_mcmc_4p_SSM4p <- GRTRN_MHmcmc(previous="intermediate1000.Rdata")
##D # Example to use of the epsilon parameter to get confidence level
##D resultNest_4p_epsilon <- resultNest_4p
##D resultNest_4p_epsilon$fixed.parameters <- c(resultNest_4p_epsilon$par, 
##D                    resultNest_4p_epsilon$fixed.parameters)
##D resultNest_4p_epsilon$par <- c(epsilon = 0)
##D pMCMC <- TRN_MHmcmc_p(resultNest_4p_epsilon, accept = TRUE)
##D resultNest_mcmc_4p_epsilon <- GRTRN_MHmcmc(result = resultNest_4p_epsilon, 
##D            n.iter = 10000, parametersMCMC = pMCMC,
##D            n.chains = 1, n.adapt = 0, thin = 1, trace = TRUE, parallel = TRUE)
##D data(resultNest_mcmc_4p_epsilon)
##D plot(resultNest_mcmc_4p_epsilon, parameters="epsilon", xlim=c(-11, 11), las=1)
##D plotR(resultNest_4p_epsilon, SE=c(epsilon = unname(resultNest_mcmc_4p_epsilon$SD)), 
##D            ylim=c(0, 3), las=1)
## End(Not run)



