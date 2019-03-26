library(fGarch)


### Name: plot-methods
### Title: GARCH Plot Methods
### Aliases: plot-methods plot,ANY,ANY-method plot,fGARCH,missing-method
### Keywords: models

### ** Examples

## garchSim -
   # Default Garch(1,1) Model:
   x = garchSim(n = 200)
   head(x) 

## garchFit - 
   fit = garchFit(formula = ~ garch(1, 1), data = x, trace = FALSE)
   
## Batch Plot:
   plot(fit, which = 3)
   
## Not run: 
##D ## Plot:
##D    # Interactive Plot:
##D    plot(fit) 
## End(Not run)



