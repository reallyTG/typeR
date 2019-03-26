library(fGarch)


### Name: fitted-methods
### Title: Extract GARCH Model Fitted Values
### Aliases: fitted-methods fitted,ANY-method fitted,fGARCH-method
### Keywords: models

### ** Examples

## Swiss Pension fund Index -
   x = as.timeSeries(data(LPP2005REC))
  
## garchFit - 
   # Fit LPP40 Bechmark:
   fit = garchFit(LPP40 ~ garch(1, 1), data = 100*x, trace = FALSE)
   fit
   
## fitted - 
   # Fitted values are now a "timeSeries" oject:
   fitted = fitted(fit)
   head(fitted)
   class(fitted)
   
## slot - 
   # The slot contains a numeric Vector:
   fitted = slot(fit, "fitted")
   head(fitted)
   class(fitted)



