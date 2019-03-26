library(embryogrowth)


### Name: embryogrowth-package
### Title: The package embryogrowth
### Aliases: embryogrowth-package
### Keywords: Ecology Embryo Gompertz Growth Sex-determination Temperature

### ** Examples

## Not run: 
##D library("embryogrowth")
##D packageVersion("embryogrowth")
##D data(nest)
##D formated <- FormatNests(nest)
##D # The initial parameters value can be:
##D # "T12H", "DHA",  "DHH", "Rho25"
##D # Or
##D # "T12L", "DT", "DHA",  "DHH", "DHL", "Rho25"
##D x <- structure(c(115.758929130522, 428.649022170996, 503.687251738993, 
##D 12.2621455821612, 306.308841227278, 116.35048615105), .Names = c("DHA", 
##D "DHH", "DHL", "DT", "T12L", "Rho25"))
##D # or
##D x <- structure(c(118.431040984352, 498.205702157603, 306.056280989839, 
##D 118.189669472381), .Names = c("DHA", "DHH", "T12H", "Rho25"))
##D # pfixed <- c(K=82.33) or rK=82.33/39.33
##D pfixed <- c(rK=2.093313)
##D 
##D ################################################################################
##D #
##D # The values of rK=2.093313 and M0=1.7 were used in 
##D # Girondot, M. & Kaska, Y. 2014. A model to predict the thermal 
##D # reaction norm for the embryo growth rate from field data. Journal of
##D # Thermal Biology. 45, 96-102.
##D #
##D # Based on recent analysis on table of development for both Emys orbicularis and 
##D # Caretta caretta, best value for pfixed should be 1.209 and M0 should be 0.34.
##D # Girondot, M., Monsinjon, J., Guillon, J.-M., Submitted. Delimitation of the 
##D # embryonic thermosensitive period for sex determination using an embryo growth 
##D # model reveals a potential bias for sex ratio prediction in turtles.
##D #
##D # See the example in the stages datasets
##D # 
##D ################################################################################
##D 
##D resultNest_4p_SSM4p <- searchR(parameters=x, fixed.parameters=pfixed, 
##D 	temperatures=formated, derivate=dydt.Gompertz, M0=1.7, 
##D 	test=c(Mean=39.33, SD=1.92))
##D data(resultNest_4p_SSM4p)
##D par(mar=c(4, 4, 1, 1))
##D plot(resultNest_4p_SSM4p$data[[1]][, 1]/60/24,resultNest_4p_SSM4p$data[[1]][, 2], bty="n", las=1, 
##D      xlab="Days of incubation", ylab="Temperatures in °C", 
##D      type="l", xlim=c(0,70),ylim=c(20, 35))
##D for (i in 2:resultNest_4p_SSM4p$data$IndiceT[3]) {
##D   par(new=TRUE)
##D   plot(resultNest_4p_SSM4p$data[[i]][, 1]/60/24,resultNest_4p_SSM4p$data[[i]][, 2], 
##D   bty="n", las=1, xlab="", ylab="", type="l", xlim=c(0,70),ylim=c(20, 35), axes = FALSE)
##D }
##D par(mar=c(4, 4, 1, 1))
##D pMCMC <- TRN_MHmcmc_p(resultNest_4p_SSM4p, accept=TRUE)
##D # Take care, it can be very long, sometimes several days
##D resultNest_mcmc_4p_SSM4p <- GRTRN_MHmcmc(result=resultNest_4p_SSM4p,  
##D 	parametersMCMC=pMCMC, n.iter=10000, n.chains = 1, n.adapt = 0,  
##D 	thin=1, trace=TRUE)
##D data(resultNest_mcmc_4p_SSM4p)
##D out <- as.mcmc(resultNest_mcmc_4p_SSM4p)
##D # This out obtained after as.mcmc can be used with coda package
##D # plot() can use the direct output of GRTRN_MHmcmc() function.
##D plot(resultNest_mcmc_4p_SSM4p, parameters=1, xlim=c(0,550))
##D plot(resultNest_mcmc_4p_SSM4p, parameters=3, xlim=c(290,320))
##D # But rather than to use the SD for each parameter independantly, it is
##D # more logical to estimate the distribution of the curves
##D new_result <- ChangeSSM(resultmcmc = resultNest_mcmc_4p_SSM4p, result = resultNest_4p_SSM4p,
##D                         temperatures = seq(from = 20, to = 35, by = 0.1), 
##D                         initial.parameters = NULL)
##D par(mar=c(4, 4, 1, 5)+0.4)
##D 
##D plotR(result = resultNest_4p_SSM4p, parameters = new_result$par, 
##D            ylabH = "Temperatures\ndensity", ylimH=c(0, 0.3), atH=c(0, 0.1, 0.2), 
##D            ylim=c(0, 3), show.hist=TRUE)
##D       
##D # Beautiful density plots
##D 
##D plotR(result = resultNest_4p_SSM4p, 
##D              resultmcmc=resultNest_mcmc_4p_SSM4p, 
##D              curves = "MCMC quantiles", show.density=TRUE)
##D 
##D plotR(resultNest_6p_SSM6p, resultmcmc=resultNest_mcmc_6p_SSM6p, 
##D             ylim=c(0, 4), show.density=TRUE, show.hist=TRUE, 
##D             curves = "MCMC quantiles", 
##D             ylimH=c(0,0.5), atH=c(0, 0.1, 0.2))
## End(Not run)



