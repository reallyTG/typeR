library(embryogrowth)


### Name: resultNest_6p_SSM6p
### Title: Fit using the nest database
### Aliases: resultNest_6p_SSM6p
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
##D x <- structure(c(115.770032186805, 428.649144244891, 503.716700005443, 
##D 12.2641939339981, 306.305498098871, 116.380086027401), 
##D .Names = c("DHA", "DHH", "DHL", "DT", "T12L", "Rho25"))
##D pfixed <- c(rK=2.093313)
##D resultNest_6p_SSM6p <- searchR(parameters=x, fixed.parameters=pfixed, 
##D 	temperatures=formated, derivate=dydt.Gompertz, M0=1.7, 
##D 	test=c(Mean=39.33, SD=1.92))
## End(Not run)



