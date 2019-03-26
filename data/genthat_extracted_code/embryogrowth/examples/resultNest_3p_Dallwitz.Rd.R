library(embryogrowth)


### Name: resultNest_3p_Dallwitz
### Title: Fit using the nest database
### Aliases: resultNest_3p_Dallwitz
### Keywords: datasets

### ** Examples

## Not run: 
##D library(embryogrowth)
##D data(nest)
##D formated <- FormatNests(nest)
##D x <- structure(c(4.88677476830268, 20.4051904475743, 31.5173105860335), 
##D .Names = c("Dallwitz_b1", "Dallwitz_b2", "Dallwitz_b3"))
##D pfixed <- c(rK=1.208968)
##D resultNest_3p_Dallwitz <- searchR(parameters=x, fixed.parameters=pfixed, 
##D 	temperatures=formated, derivate=dydt.Gompertz, M0=0.3470893, 
##D 	test=c(Mean=39.33, SD=1.92))
##D plotR(result=resultNest_3p_Dallwitz, show.hist = TRUE,
##D              ylim=c(0, 8), curves="ML quantiles")
## End(Not run)



