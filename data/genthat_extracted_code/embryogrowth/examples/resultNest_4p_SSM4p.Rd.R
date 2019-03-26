library(embryogrowth)


### Name: resultNest_4p_SSM4p
### Title: Fit using the nest database
### Aliases: resultNest_4p_SSM4p
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
##D plotR(result=resultNest_4p_SSM4p, show.hist = TRUE,
##D              ylim=c(0, 4), curves="ML quantiles")
## End(Not run)



