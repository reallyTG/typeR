library(embryogrowth)


### Name: resultNest_3p_Weibull
### Title: Result of the fit using the nest database using Weibull function
### Aliases: resultNest_3p_Weibull
### Keywords: datasets

### ** Examples

## Not run: 
##D library(embryogrowth)
##D data(nest)
##D formated <- FormatNests(nest)
##D # Weibull model
##D  x <- ChangeSSM(temperatures = (200:350)/10,
##D                 parameters = resultNest_4p_SSM4p$par,
##D                 initial.parameters = structure(c(73.4009010417375, 304.142079511996, 
##D                                                 27.4671689276281), 
##D                                         .Names = c("k", "lambda", "scale")), 
##D                 control=list(maxit=1000))
##D pfixed <- c(rK=2.093313)
##D resultNest_3p_Weibull <- searchR(parameters=x$par, fixed.parameters=pfixed, 
##D                          temperatures=formated, derivate=dydt.Gompertz, M0=1.7, 
##D                          test=c(Mean=39.33, SD=1.92))
##D plotR(resultNest_3p_Weibull, ylim=c(0, 3))
##D plotR(resultNest_3p_Weibull, ylim=c(0, 3), ylimH = c(0, 0.9), show.hist=TRUE)
##D compare_AIC(SSM=resultNest_4p_SSM4p, Weibull=resultNest_3p_Weibull)
## End(Not run)



