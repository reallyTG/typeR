library(fGarch)


### Name: residuals-methods
### Title: Extract GARCH Model Residuals
### Aliases: residuals-methods residuals,ANY-method residuals,fGARCH-method
### Keywords: models

### ** Examples

## Swiss Pension func Index -
   x = as.timeSeries(data(LPP2005REC))
  
## garchFit
   fit = garchFit(LPP40 ~ garch(1, 1), data = 100*x, trace = FALSE)
   fit
   
## residuals - 
   res = residuals(fit)
   head(res)
   class(res)
   
## slot - 
   res = slot(fit, "residuals")
   head(res)



