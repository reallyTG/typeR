library(SAVE)


### Name: SAVE.controls
### Title: Control parameters for kriging process.
### Aliases: SAVE.controls
### Keywords: internal

### ** Examples

## Not run: 
##D 	library(SAVE)
##D 	sc  <- SAVE.controls(lower = 0.2, upper = 0.7, optim.method = "BFGS")
##D 	sc1 <- SAVE.controls(lower = 0.2, upper = 0.7, optim.method = "BFGS",
##D 				coef.var=1, coef.trend=0)
##D 	### In this case, the parameters \code{coef.var} and \code{coef.trend} 
##D 	### will be deprecated since \code{SAVE} does not allow to fix 
##D 	### any parameter different than: \code{lower}, \code{upper}, 
##D 	### \code{optim.method} and \code{parinit}.
##D  
## End(Not run)



