library(embryogrowth)


### Name: TRN_MHmcmc_p
### Title: Generates set of parameters to be used with GRTRN_MHmcmc() or
###   STRN_MHmcmc()
### Aliases: TRN_MHmcmc_p

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
## End(Not run)



