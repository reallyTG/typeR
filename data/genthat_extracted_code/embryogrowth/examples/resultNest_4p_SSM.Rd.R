library(embryogrowth)


### Name: resultNest_4p_SSM
### Title: Fit using the nest database
### Aliases: resultNest_4p_SSM
### Keywords: datasets

### ** Examples

## Not run: 
##D library(embryogrowth)
##D data(nest)
##D formated <- FormatNests(nest)
##D x <- structure(c(109.683413821537, 614.969219372661, 306.386903812694, 
##D  229.003478775323), .Names = c("DHA", "DHH", "T12H", "Rho25"))
##D pfixed <- c(rK=1.208968)
##D resultNest_4p_SSM <- searchR(parameters=x, fixed.parameters=pfixed, 
##D 	temperatures=formated, derivate=dydt.Gompertz, M0=0.3470893, 
##D 	test=c(Mean=39.33, SD=1.92))
##D plotR(result=resultNest_4p_SSM, show.hist = TRUE,
##D              ylim=c(0, 8), curves="ML quantiles")
## End(Not run)



