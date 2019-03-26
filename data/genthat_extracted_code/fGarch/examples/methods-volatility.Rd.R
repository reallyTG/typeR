library(fGarch)


### Name: volatility-methods
### Title: Extract GARCH Model Volatility
### Aliases: volatility.fGARCH
### Keywords: models

### ** Examples

## Swiss Pension func Index -
   x = as.timeSeries(data(LPP2005REC))
  
## garchFit
   fit = garchFit(LPP40 ~ garch(1, 1), data = 100*x, trace = FALSE)
   fit
   
## volatility - 
   # Standard Deviation:
   volatility = volatility(fit, type = "sigma")
   head(volatility)
   class(volatility)
   # Variance:
   volatility = volatility(fit, type = "h")
   head(volatility)
   class(volatility)
   
## slot - 
   volatility = slot(fit, "sigma.t")
   head(volatility)
   class(volatility)
   volatility = slot(fit, "h.t")
   head(volatility)
   class(volatility)



