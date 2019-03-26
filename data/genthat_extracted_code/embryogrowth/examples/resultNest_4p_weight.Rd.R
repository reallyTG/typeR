library(embryogrowth)


### Name: resultNest_4p_weight
### Title: Fit using the nest database with weight
### Aliases: resultNest_4p_weight
### Keywords: datasets

### ** Examples

## Not run: 
##D library(embryogrowth)
##D data(nest)
##D formated <- FormatNests(nest)
##D w <- weightmaxentropy(formated, control_plot=list(xlim=c(20,36)))
##D x <- structure(c(118.768297442004, 475.750095909406, 306.243694918151, 
##D 116.055824800264), .Names = c("DHA", "DHH", "T12H", "Rho25"))
##D # pfixed <- c(K=82.33) or rK=82.33/39.33
##D pfixed <- c(rK=2.093313)
##D # K or rK are not used for dydt.linear or dydt.exponential
##D resultNest_4p_weight <- searchR(parameters=x,  
##D 	fixed.parameters=pfixed, temperatures=formated,  
##D 	derivate=dydt.Gompertz, M0=1.7, test=c(Mean=39.33, SD=1.92),  
##D 	method = "BFGS", weight=w)
##D data(resultNest_4p_weight)
##D plotR(resultNest_4p_weight, ylim=c(0,0.50), xlim=c(15, 35))
## End(Not run)



