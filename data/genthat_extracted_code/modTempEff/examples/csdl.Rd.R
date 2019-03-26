library(modTempEff)


### Name: csdl
### Title: Defining the constrained segmented distributed lag term
### Aliases: csdl
### Keywords: regression

### ** Examples

## Not run: 
##D # Evaluate temperature effects up to 45 lags for cold and heat and 
##D # a single breakpoint; use 20 as starting value, a global difference 
##D # penalty on spline coefficients and no ridge penalty
##D csdl(my.temperature,psi=20,L=c(45,45),ridge=NULL)
##D 
##D # Evaluate temperature effects up to 45 lags for cold and 15 lag for 
##D # heat, via P-splines with a global difference penalty on DL coefficients 
##D # and an additional quadratic ridge penalty
##D csdl(my.temperature,psi=20,L=c(45,15),DL=TRUE,ridge=list(cold="l^2", 
##D   heat="l^2"))
## End(Not run)



