library(embryogrowth)


### Name: likelihoodR
### Title: Estimate the likelihood of a set of parameters for nest
###   incubation data
### Aliases: likelihoodR

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
##D x <- structure(c(118.768297442004, 475.750095909406, 306.243694918151, 
##D 116.055824800264), .Names = c("DHA", "DHH", "T12H", "Rho25"))
##D # pfixed <- c(K=82.33) or rK=82.33/39.33
##D pfixed <- c(rK=2.093313)
##D # K or rK are not used for dydt.linear or dydt.exponential
##D LresultNest_4p <- likelihoodR(parameters=x, fixed.parameters=pfixed,  
##D 	temperatures=formated, derivate=dydt.Gompertz, M0=1.7,  
##D 	test=c(Mean=39.33, SD=1.92))
##D data(resultNest_4p_SSM4p)
##D LresultNest_4p <- likelihoodR(result=resultNest_4p_SSM4p)
## End(Not run)



