library(fGarch)


### Name: show-methods
### Title: GARCH Modelling Show Methods
### Aliases: show-methods show,ANY-method show,fGARCH-method
###   show,fGARCHSPEC-method
### Keywords: models

### ** Examples

## garchSpec -
   spec = garchSpec()
   print(spec)

## garchSim -
   x = garchSim(spec, n = 500) 

## garchFit - 
   fit = garchFit(~ garch(1, 1), data = x)
   print(fit)



