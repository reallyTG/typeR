library(fGarch)


### Name: coef-methods
### Title: GARCH Coefficients Methods
### Aliases: coef-methods coef,ANY-method coef,fGARCH-method
###   coef,fGARCHSPEC-method
### Keywords: models

### ** Examples

## garchSpec -
   # Use default parameters beside alpha:
   spec = garchSpec(model = list(alpha = c(0.05, 0.05)))
   spec
   coef(spec)
   
## garchSim -
   # Simulate an univariate "timeSeries" series
   x = garchSim(spec, n = 200)
   x = x[,1]
  
## garchFit - 
   fit = garchFit( ~ garch(1, 1), data = x)
   
## coef - 
   coef(fit)



