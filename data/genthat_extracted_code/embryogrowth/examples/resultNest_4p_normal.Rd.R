library(embryogrowth)


### Name: resultNest_4p_normal
### Title: Result of the fit using the nest database using asymmetric
###   normal function
### Aliases: resultNest_4p_normal
### Keywords: datasets

### ** Examples

## Not run: 
##D library(embryogrowth)
##D data(nest)
##D formated <- FormatNests(nest)
##D x <- ChangeSSM(temperatures = (200:350)/10,
##D                parameters = resultNest_4p_SSM4p$par,
##D                initial.parameters = structure(c(3, 7, 11, 32), 
##D                                .Names = c("Scale", "sdL", "sdH", "Peak")), 
##D                control=list(maxit=1000))
##D pfixed <- c(rK=2.093313)
##D resultNest_4p_normal <- searchR(parameters=x$par, fixed.parameters=pfixed, 
##D                          temperatures=formated, derivate=dydt.Gompertz, M0=1.7, 
##D                          test=c(Mean=39.33, SD=1.92))
##D plotR(resultNest_4p_normal, ylim=c(0, 3))
##D plotR(resultNest_4p_normal, ylim=c(0, 3), ylimH = c(0, 0.9), show.hist=TRUE)
##D compare_AIC(SSM=resultNest_4p_SSM4p, Asymmetric.normal=resultNest_4p_normal)
## End(Not run)



