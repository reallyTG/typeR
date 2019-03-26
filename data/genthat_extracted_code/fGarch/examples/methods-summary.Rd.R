library(fGarch)


### Name: summary-methods
### Title: GARCH Summary Methods
### Aliases: summary-methods summary,ANY-method summary,fGARCH-method
### Keywords: models

### ** Examples

## garchSim -
   x = garchSim(n = 200)

## garchFit - 
   fit = garchFit(formula = x ~ garch(1, 1), data = x, trace = FALSE)
   summary(fit)



