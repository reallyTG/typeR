library(embryogrowth)


### Name: searchR
### Title: Fit the parameters that best represent nest incubation data.
### Aliases: searchR

### ** Examples

## Not run: 
##D library(embryogrowth)
##D data(nest)
##D formated <- FormatNests(nest)
##D # The initial parameters value can be:
##D # "T12H", "DHA",  "DHH", "Rho25"
##D # Or
##D # "T12L", "DT", "DHA",  "DHH", "DHL", "Rho25"
##D # K for Gompertz must be set as fixed parameter or being a constant K  
##D # or relative to the hatchling size rK
##D x <- structure(c(105.966881676793, 613.944134764125, 306.449533440186, 
##D                 118.193882815108), .Names = c("DHA", "DHH", "T12H", "Rho25"))
##D # pfixed <- c(K=82.33) or rK=82.33/39.33
##D pfixed <- c(rK=2.093313)
##D resultNest_4p_SSM4p <- searchR(parameters=x, fixed.parameters=pfixed, 
##D 	temperatures=formated, derivate=dydt.Gompertz, M0=1.7, 
##D 	test=c(Mean=39.33, SD=1.92))
##D data(resultNest_4p_SSM4p)
##D plot(resultNest_4p_SSM4p, xlim=c(0,70), ylimT=c(22, 32), ylimS=c(0,45), series=1, 
##D embryo.stages="Caretta caretta.SCL")
##D x <- structure(c(106.567809092008, 527.359011254683, 614.208632495199, 
##D 2720.94506457237, 306.268259715624, 120.336791245212), .Names = c("DHA", 
##D "DHH", "DHL", "DT", "T12L", "Rho25"))
##D pfixed <- c(rK=2.093313)
##D 
##D # exemple of data.frame for test
##D ttest <- data.frame(Mean=rep(25.5, formated$IndiceT["NbTS"]), 
##D                      SD=rep(0.75, formated$IndiceT["NbTS"]), 
##D                      row.names=names(formated)[1:formated$IndiceT["NbTS"]])
##D resultNest_6p_SSM6p <- searchR(parameters=x, fixed.parameters=pfixed, 
##D 	                        temperatures=formated, derivate=dydt.Gompertz, M0=1.7, 
##D 	                        test=ttest)
##D 	                        
##D data(resultNest_6p_SSM6p)
##D pMCMC <- TRN_MHmcmc_p(resultNest_6p_SSM6p, accept=TRUE)
##D # Take care, it can be very long, sometimes several days
##D resultNest_mcmc_6p_SSM6p <- GRTRN_MHmcmc(result=resultNest_6p_SSM6p,  
##D 	parametersMCMC=pMCMC, n.iter=10000, n.chains = 1, n.adapt = 0,  
##D 	thin=1, trace=TRUE)
##D data(resultNest_mcmc_6p_SSM6p)
##D # compare_AIC() is a function from the package "HelpersMG"
##D compare_AIC(test1=resultNest_4p_SSM4p, test2=resultNest_6p_SSM6p)
##D ############ with new parametrization
##D data(resultNest_4p_SSM4p)
##D x0 <- resultNest_4p_SSM4p$par
##D t <- hist(resultNest_4p_SSM4p, plot=FALSE)
##D x <- c(3.4, 3.6, 5.4, 5.6, 7.6, 7.5, 3.2)
##D names(x) <- seq(from=range(t$temperatures)[1], to=range(t$temperatures)[2], 
##D      length.out=7)
##D newx <- ChangeSSM(temperatures = (200:350)/10, parameters = x0, 
##D        initial.parameters = x, 
##D        control=list(maxit=5000))
##D pfixed <- c(rK=2.093313)
##D resultNest_newp <- searchR(parameters=newx, fixed.parameters=pfixed,
##D  temperatures=formated, derivate=dydt.Gompertz, M0=1.7,
##D  test=c(Mean=39.33, SD=1.92))
##D plotR(resultNest_newp, ylim=c(0, 3), xlimR=c(23, 34), ylimH=c(0, 0.3), show.hist.TRUE)
##D compare_AIC(test4p=resultNest_4p_SSM4p, 
##D             test6p=resultNest_6p_SSM6p, 
##D             testAnchor=resultNest_newp)
##D             
##D ############################################
##D # example with thermal reaction norm fitted from Weibull function
##D ############################################
##D 
##D  x <- ChangeSSM(temperatures = (200:350)/10,
##D                 parameters = resultNest_4p_SSM4p$par,
##D                 initial.parameters = structure(c(73.4009010417375, 304.142079511996, 
##D                                                 27.4671689276281), 
##D                                         .Names = c("k", "lambda", "scale")), 
##D                 control=list(maxit=1000))
##D pfixed <- c(rK=2.093313)
##D resultNest_3p_Weibull <- searchR(parameters=x$par, fixed.parameters=pfixed, 
##D                          temperatures=formated, derivate=dydt.Gompertz, M0=1.7, 
##D                          test=c(Mean=39.33, SD=1.92))
##D plotR(list(resultNest_4p_SSM4p, resultNest_3p_Weibull), ylim=c(0,3), col=c("Black", "red"))
##D compare_AIC(SSM4p=resultNest_4p_SSM4p, Weibull=resultNest_3p_Weibull)
##D 
##D ###########################################
##D # example with thermal reaction norm fitted from asymmetric normal function
##D ############################################
##D 
##D x <- ChangeSSM(temperatures = (200:350)/10,
##D                parameters = resultNest_4p_SSM4p$par,
##D                initial.parameters = structure(c(3, 7, 11, 32), 
##D                                .Names = c("Scale", "sdL", "sdH", "Peak")), 
##D                control=list(maxit=1000))
##D pfixed <- c(rK=2.093313)
##D resultNest_4p_normal <- searchR(parameters=x$par, fixed.parameters=pfixed, 
##D                          temperatures=formated, derivate=dydt.Gompertz, M0=1.7, 
##D                          test=c(Mean=39.33, SD=1.92))
##D                          
##D ###########################################
##D # example with thermal reaction norm fitted from trigonometric model
##D ############################################
##D 
##D  x <- ChangeSSM(temperatures = (200:350)/10,
##D                parameters = resultNest_4p_SSM4p$par,
##D                initial.parameters = structure(c(3, 20, 40, 32), 
##D                .Names = c("Max", "LengthB", "LengthE", "Peak")), 
##D                control=list(maxit=1000))
##D pfixed <- c(rK=2.093313)
##D resultNest_4p_trigo <- searchR(parameters=x$par, fixed.parameters=pfixed, 
##D                          temperatures=formated, derivate=dydt.Gompertz, M0=1.7, 
##D                          test=c(Mean=39.33, SD=1.92))
##D                          
##D ###########################################
##D # example with thermal reaction norm fitted from Dallwitz model
##D # From Girondot, M., Monsinjon, J., Guillon, J.-M., Submitted. Delimitation of the 
##D # embryonic thermosensitive period for sex determination using an embryo growth model 
##D # reveals a potential bias for sex ratio prediction in turtles.
##D #  rK = 1.208968 
##D #  M0 = 0.3470893 
##D # See the example in stages datasets
##D ############################################
##D 
##D x <- structure(c(4.88677476830268, 20.4051904475743, 31.5173105860335), 
##D .Names = c("Dallwitz_b1", "Dallwitz_b2", "Dallwitz_b3"))
##D pfixed <- c(rK=1.208968)
##D resultNest_3p_Dallwitz <- searchR(parameters=x, fixed.parameters=pfixed, 
##D                          temperatures=formated, derivate=dydt.Gompertz, M0=0.3470893, 
##D                          test=c(Mean=39.33, SD=1.92))
##D plotR(resultNest_3p_Dallwitz, ylim=c(0,8))
##D 
##D x <- structure(c(4.91191231405918, 12.7453211281394, 31.2670410811077, 
##D 5.7449376569153, -0.825689964543813), .Names = c("Dallwitz_b1", 
##D "Dallwitz_b2", "Dallwitz_b3", "Dallwitz_b4", "Dallwitz_b5"))
##D pfixed <- c(rK=1.208968)
##D resultNest_5p_Dallwitz <- searchR(parameters=x, fixed.parameters=pfixed, 
##D                          temperatures=formated, derivate=dydt.Gompertz, M0=0.3470893, 
##D                          test=c(Mean=39.33, SD=1.92))
##D plotR(resultNest_5p_Dallwitz, ylim=c(0,8))
##D 
##D xp <- resultNest_6p_SSM6p$par
##D xp["Rho25"] <- 233
##D pfixed <- c(rK=1.208968)
##D resultNest_6p_SSM <- searchR(parameters=xp, fixed.parameters=pfixed, 
##D                          temperatures=formated, derivate=dydt.Gompertz, M0=0.3470893, 
##D                          test=c(Mean=39.33, SD=1.92))
##D plotR(resultNest_6p_SSM, ylim=c(0,8))
##D 
##D xp <- ChangeSSM(parameters = resultNest_3p_Dallwitz$par, 
##D                 initial.parameters = resultNest_4p_SSM4p$par)
##D pfixed <- c(rK=1.208968)
##D resultNest_4p_SSM <- searchR(parameters=xp$par, fixed.parameters=pfixed, 
##D                          temperatures=formated, derivate=dydt.Gompertz, M0=0.3470893, 
##D                          test=c(Mean=39.33, SD=1.92))
##D plotR(resultNest_4p_SSM, ylim=c(0,8))
##D 
##D compare_AIC(Dallwitz3p=resultNest_3p_Dallwitz, Dallwitz5p=resultNest_5p_Dallwitz, 
##D              SSM4p=resultNest_4p_SSM, SSM6p=resultNest_6p_SSM)
##D                          
##D ###########################################
##D # Example with thermal reaction norm of proportion of development
##D # fitted from Dallwitz model
##D # see Woolgar, L., Trocini, S., Mitchell, N., 2013. Key parameters describing 
##D # temperature-dependent sex determination in the southernmost population of loggerhead 
##D # sea turtles. Journal of Experimental Marine Biology and Ecology 449, 77-84.
##D ############################################
##D 
##D x <- structure(c(1.48207559695689, 20.1100310234046, 31.5665036287242), 
##D  .Names = c("Dallwitz_b1", "Dallwitz_b2", "Dallwitz_b3"))
##D resultNest_PropDev_3p_Dallwitz <- searchR(parameters=x, fixed.parameters=NULL, 
##D                          temperatures=formated, derivate=dydt.linear, M0=0, 
##D                          test=c(Mean=1, SD=NA))
##D  plotR(resultNest_PropDev_3p_Dallwitz, ylim=c(0, 1.5), curves="ML")
##D  plot(x=resultNest_PropDev_3p_Dallwitz, ylimS=c(0,1), xlim=c(0,60), series=2, 
##D          embryo.stages="Generic.ProportionDevelopment")
##D          
##D x <- structure(c(1.48904182113431, 10.4170365155993, 31.2591665490154, 
##D 6.32355497589913, -1.07425378667104), .Names = c("Dallwitz_b1", 
##D "Dallwitz_b2", "Dallwitz_b3", "Dallwitz_b4", "Dallwitz_b5"))
##D resultNest_PropDev_5p_Dallwitz <- searchR(parameters=x, fixed.parameters=NULL, 
##D                          temperatures=formated, derivate=dydt.linear, M0=0, 
##D                          test=c(Mean=1, SD=NA))
##D  plotR(resultNest_PropDev_5p_Dallwitz, ylim=c(0, 1.5))
##D  plot(x=resultNest_PropDev_5p_Dallwitz, ylimS=c(0,1), xlim=c(0,60), series=2, 
##D          embryo.stages="Generic.ProportionDevelopment")
##D          
##D  plotR(resultNest_PropDev_3p_Dallwitz, ylim=c(0, 1.5), curves="ML")
##D  plotR(resultNest_PropDev_5p_Dallwitz, ylim=c(0, 1.5), curves="ML", new=FALSE, col="red")
##D  compare_AICc(Dallwitz3p=resultNest_PropDev_3p_Dallwitz, 
##D               Dallwitz5p=resultNest_PropDev_5p_Dallwitz)
##D 
## End(Not run)



