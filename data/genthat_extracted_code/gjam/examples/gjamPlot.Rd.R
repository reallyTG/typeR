library(gjam)


### Name: gjamPlot
### Title: Plot gjam analysis
### Aliases: gjamPlot

### ** Examples

## Not run: 
##D ## ordinal data
##D f   <- gjamSimData(S = 15, Q = 3, typeNames = 'OC') 
##D ml  <- list(ng = 200, burnin = 50, typeNames = f$typeNames, holdoutN = 10)
##D out <- gjam(f$formula, f$xdata, f$ydata, modelList = ml)
##D 
##D # repeat with ng = 2000, burnin = 500, then plot data here:
##D pl  <- list(trueValues = f$trueValues, width=3, height=2)
##D fit <- gjamPlot(output = out, plotPars = pl)
## End(Not run)



