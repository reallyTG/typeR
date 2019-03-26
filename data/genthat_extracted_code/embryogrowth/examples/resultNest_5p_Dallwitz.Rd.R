library(embryogrowth)


### Name: resultNest_5p_Dallwitz
### Title: Fit using the nest database
### Aliases: resultNest_5p_Dallwitz
### Keywords: datasets

### ** Examples

## Not run: 
##D library(embryogrowth)
##D data(nest)
##D formated <- FormatNests(nest)
##D x <- structure(c(4.91191231405918, 12.7453211281394, 31.2670410811077, 
##D  5.7449376569153, -0.825689964543813), .Names = c("Dallwitz_b1",
##D  "Dallwitz_b2", "Dallwitz_b3", "Dallwitz_b4", "Dallwitz_b5"))
##D pfixed <- c(rK=1.208968)
##D resultNest_5p_Dallwitz <- searchR(parameters=x, fixed.parameters=pfixed, 
##D 	temperatures=formated, derivate=dydt.Gompertz, M0=0.3470893, 
##D 	test=c(Mean=39.33, SD=1.92))
##D plotR(result=resultNest_5p_Dallwitz, show.hist = TRUE,
##D              ylim=c(0, 8), curves="ML quantiles")
## End(Not run)



