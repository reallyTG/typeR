library(embryogrowth)


### Name: STRN_MHmcmc
### Title: Metropolis-Hastings algorithm for Sexualisation Thermal Reaction
###   Norm
### Aliases: STRN_MHmcmc

### ** Examples

## Not run: 
##D library(embryogrowth)
##D MedIncubation_Cc <- subset(DatabaseTSD, Species=="Caretta caretta" & 
##D RMU=="Mediterranean" & Sexed!=0)
##D Med_Cc <- with(MedIncubation_Cc, tsd(males=Males, females=Females, 
##D  temperatures=Incubation.temperature, par=c(P=29.5, S=-0.01)))
##D plot(Med_Cc, xlim=c(25, 35))
##D males <- c(7, 0, 0, 0, 0, 5, 6, 3, 5, 3, 2, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0)
##D names(males) <- rev(rev(names(resultNest_4p_SSM4p$data))[-(1:2)])
##D sexed <- rep(10, length(males))
##D names(sexed) <- rev(rev(names(resultNest_4p_SSM4p$data))[-(1:2)])
##D Initial_STRN <- resultNest_4p_SSM4p$par[c("DHA", "DHH", "T12H")]
##D Initial_STRN <- structure(c(3460.21379985491, 588.062535503578, 2347.70617453574), 
##D                           .Names = c("DHA", "DHH", "T12H"))
##D fp <- c(Rho25=100)
##D fitSTRN <- STRN(Initial_STRN, EmbryoGrowthTRN=resultNest_4p_SSM4p, tsd=Med_Cc, 
##D                 Sexed=sexed, Males=males, 
##D                 fixed.parameters=fp,  
##D                 Temperatures="TSP.MassWeighted.STRNWeighted.temperature.mean")
##D pMCMC <- TRN_MHmcmc_p(fitSTRN, accept=TRUE)
##D pMCMC[, "Density"] <- "dunif"
##D pMCMC[, "Prior2"] <- pMCMC[, "Max"]<- 10000
##D pMCMC[, "Prior1"] <- pMCMC[, "Min"] <- 1
##D outMCMC <- STRN_MHmcmc(result = fitSTRN, n.iter = 50000, parametersMCMC = pMCMC,
##D                 n.chains = 1, n.adapt = 0, thin = 1, trace = TRUE,
##D                 dataSTRN = list(EmbryoGrowthTRN = resultNest_4p_SSM4p, 
##D                    Temperatures = "TSP.STRNWeighted.temperature.mean", 
##D                    fixed.parameters=fitSTRN$fixed.parameters,
##D                    tsd=Med_Cc, 
##D                    Sexed=sexed, Males=males), 
##D                 adaptive = TRUE, adaptive.lag = 500, 
##D                 intermediate = 1000,
##D                 filename = "intermediate_mcmcSTRN.Rdata")
##D plot(outMCMC, parameters=1)
##D plot(outMCMC, parameters=2)
##D plot(outMCMC, parameters=3)
##D 1-rejectionRate(as.mcmc(x = outMCMC))
##D # Take care,you computer will be 100% busy as all cores will be used intensively
##D outMCMC_parallel <- parallel::mclapply(1:detectCores(), function(x) {
##D                 STRN_MHmcmc(result = fitSTRN, n.iter = 50000/detectCores(), 
##D                 parametersMCMC = pMCMC,
##D                 n.chains = 1, n.adapt = 0, thin = 1, trace = TRUE,
##D                 dataSTRN = list(EmbryoGrowthTRN = resultNest_4p_SSM4p, 
##D                    Temperatures = "TSP.STRNWeighted.temperature.mean", 
##D                    fixed.parameters=fitSTRN$fixed.parameters,
##D                    tsd=Med_Cc, 
##D                    Sexed=sexed, Males=males), 
##D                 parallel=FALSE, 
##D                 adaptive = TRUE, adaptive.lag = 500, 
##D                 intermediate = NULL)
##D })
##D outMCMC_parallel_merge <- outMCMC_parallel[[1]]
##D for (i in 2:length(outMCMC_parallel)) {
##D   outMCMC_parallel_merge <- merge(outMCMC_parallel_merge, outMCMC_parallel[[i]])
##D }
##D plot(outMCMC_parallel_merge, parameters=1)
##D plot(outMCMC_parallel_merge, parameters=2)
##D plot(outMCMC_parallel_merge, parameters=3)
##D 
##D plotR(parameters = fitSTRN$par, fixed.parameters=fitSTRN$fixed.parameters, 
##D       curves = "MCMC quantiles", ylim=c(0, 5), resultmcmc = outMCMC_parallel_merge, 
##D       ylab="Relative contribution to sexualisation", xlim=c(28, 29))
##D 
## End(Not run)



