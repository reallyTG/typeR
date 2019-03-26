library(embryogrowth)


### Name: resultNest_6p_SSM
### Title: Fit using the nest database
### Aliases: resultNest_6p_SSM
### Keywords: datasets

### ** Examples

## Not run: 
##D library(embryogrowth)
##D data(nest)
##D formated <- FormatNests(nest)
##D x <- structure(c(104.954347370542, 3447.10062406071, 661.269363920423, 
##D  96.3871849546537, 306.456389026151, 232.105840347154), .Names = c("DHA", 
##D  "DHH", "DHL", "DT", "T12L", "Rho25"))
##D pfixed <- c(rK=1.208968)
##D resultNest_6p_SSM <- searchR(parameters=x, fixed.parameters=pfixed, 
##D 	temperatures=formated, derivate=dydt.Gompertz, M0=0.3470893, 
##D 	test=c(Mean=39.33, SD=1.92))
##D plotR(result=resultNest_6p_SSM, show.hist = TRUE,
##D              ylim=c(0, 8), curves="ML")
## End(Not run)



