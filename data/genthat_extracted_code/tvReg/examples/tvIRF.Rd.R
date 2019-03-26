library(tvReg)


### Name: tvIRF
### Title: Time-Varying Impulse Response Function
### Aliases: tvIRF tvirf-class tvirf. tvIRF.tvvar

### ** Examples

## Not run: 
##D ##Inflation rate, unemployment rate and treasury bill 
##D ##interest rate for the US as in Primiceri (2005). 
##D data(usmacro, package = "bvarsv")
##D model.tvVAR <- tvVAR(usmacro, p = 4, type = "const")
##D 
##D ##Estimate a the tvIRF with time-varying covariance function
##D model.tvIRF <- tvIRF(model.tvVAR)
##D 
##D ##Cumulative impulse response function
##D model.tvIRF2 <- tvIRF(model.tvVAR, cumulative = TRUE)
## End(Not run)




