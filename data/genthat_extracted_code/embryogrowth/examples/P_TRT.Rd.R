library(embryogrowth)


### Name: P_TRT
### Title: Estimate the transitional range of temperatures based on a set
###   of parameters
### Aliases: P_TRT

### ** Examples

## Not run: 
##D library("embryogrowth")
##D CC_AtlanticSW <- subset(DatabaseTSD, RMU=="Atlantic, SW" & 
##D                           Species=="Caretta caretta" & Sexed!=0)
##D tsdL <- with (CC_AtlanticSW, tsd(males=Males, females=Females, 
##D                                  temperatures=Incubation.temperature-Correction.factor, 
##D                                  equation="logistic"))
##D P_TRT(tsdL)
##D P_TRT(tsdL, replicate.CI=1000)
##D P_TRT(tsdL, replicate.CI=1000, temperatures=20:35)
##D P_TRT_out <- P_TRT(tsdL, replicate.CI=1000, temperatures=c(T1=20, T2=35))
##D attributes(P_TRT_out$sexratio_quantiles)$temperatures
##D P_TRT(tsdL$par, equation="logistic")
##D pMCMC <- tsd_MHmcmc_p(tsdL, accept=TRUE)
##D # Take care, it can be very long
##D result_mcmc_tsd <- tsd_MHmcmc(result=tsdL, 
##D 		parametersMCMC=pMCMC, n.iter=10000, n.chains = 1,  
##D 		n.adapt = 0, thin=1, trace=FALSE, adaptive=TRUE)
##D P_TRT(result_mcmc_tsd, equation="logistic")
## End(Not run)



