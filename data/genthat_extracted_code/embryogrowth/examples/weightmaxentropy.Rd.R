library(embryogrowth)


### Name: weightmaxentropy
### Title: Search for the weights of the nests which maximize the entropy
###   of nest temperatures distribution
### Aliases: weightmaxentropy

### ** Examples

## Not run: 
##D library(embryogrowth)
##D data(nest)
##D formated <- FormatNests(nest)
##D w <- weightmaxentropy(formated, control_plot=list(xlim=c(20,36)))
##D x <- structure(c(120.940334922916, 467.467455887442,  
##D 	306.176613681557, 117.857995419495),  
##D 	.Names = c("DHA", "DHH", "T12H", "Rho25"))
##D # pfixed <- c(K=82.33) or rK=82.33/39.33
##D pfixed <- c(rK=2.093313)
##D # K or rK are not used for dydt.linear or dydt.exponential
##D resultNest_4p_weight <- searchR(parameters=x,  
##D 	fixed.parameters=pfixed, temperatures=formated,  
##D 	derivate=dydt.Gompertz, M0=1.7, test=c(Mean=39.33, SD=1.92),  
##D 	method = "BFGS", weight=w)
##D data(resultNest_4p_weight)
##D plotR(resultNest_4p_weight, ylim=c(0,0.50), xlim=c(15, 35))
##D # Standard error of parameters can use the GRTRN_MHmcmc() function
## End(Not run)



