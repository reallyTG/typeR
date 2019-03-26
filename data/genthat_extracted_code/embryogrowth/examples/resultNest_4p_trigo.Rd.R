library(embryogrowth)


### Name: resultNest_4p_trigo
### Title: Result of the fit using the nest database using trigonometric
###   function
### Aliases: resultNest_4p_trigo
### Keywords: datasets

### ** Examples

## Not run: 
##D library(embryogrowth)
##D data(nest)
##D formated <- FormatNests(nest)
##D x <- ChangeSSM(temperatures = (200:350)/10,
##D                parameters = resultNest_4p_SSM4p$par,
##D                initial.parameters = structure(c(3, 20, 40, 32), 
##D                          .Names = c("Max", "LengthB", "LengthE", "Peak")), 
##D                control=list(maxit=1000))
##D pfixed <- c(rK=2.093313)
##D resultNest_4p_trigo <- searchR(parameters=x$par, fixed.parameters=pfixed, 
##D                          temperatures=formated, derivate=dydt.Gompertz, M0=1.7, 
##D                          test=c(Mean=39.33, SD=1.92))
##D plotR(resultNest_4p_trigo, ylim=c(0, 3))
##D plotR(resultNest_4p_trigo, ylim=c(0, 3), ylimH = c(0, 0.9), show.hist=TRUE)
##D compare_AIC(SSM=resultNest_4p_SSM4p, trigonometric=resultNest_4p_trigo)
## End(Not run)



