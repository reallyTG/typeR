library(embryogrowth)


### Name: dydt.linear
### Title: Return the derivative of the linear function
### Aliases: dydt.linear

### ** Examples

## Not run: 
##D library(embryogrowth)
##D data(nest)
##D formated <- FormatNests(nest)
##D # The initial parameters value can be:
##D # "T12H", "DHA",  "DHH", "Rho25"
##D # Or
##D # "T12L", "DT", "DHA",  "DHH", "DHL", "Rho25"
##D x <- structure(c(306.174998729436, 333.708348843241, 299.856306141849,  
##D 	149.046870203155), .Names = c("DHA", "DHH", "T12H", "Rho25"))
##D # K or rK are not used for dydt.linear or dydt.exponential
##D resultNest_4p_linear <- searchR(parameters=x, fixed.parameters=NULL,  
##D 	temperatures=formated, derivate=dydt.linear, M0=1.7,  
##D 	test=c(Mean=39.33, SD=1.92))
## End(Not run)



