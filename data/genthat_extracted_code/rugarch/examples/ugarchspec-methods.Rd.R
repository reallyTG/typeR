library(rugarch)


### Name: ugarchspec-methods
### Title: function: Univariate GARCH Specification
### Aliases: ugarchspec ugarchspec-methods ugarchspec,ANY-method
### Keywords: methods

### ** Examples

# a standard specification
spec1 = ugarchspec()
spec1
# an example which keep the ar1 and ma1 coefficients fixed:
spec2 = ugarchspec(mean.model=list(armaOrder=c(2,2), 
fixed.pars=list(ar1=0.3,ma1=0.3)))
spec2
# an example of the EWMA Model
spec3 = ugarchspec(variance.model=list(model="iGARCH", garchOrder=c(1,1)), 
		mean.model=list(armaOrder=c(0,0), include.mean=TRUE),  
		distribution.model="norm", fixed.pars=list(omega=0))



