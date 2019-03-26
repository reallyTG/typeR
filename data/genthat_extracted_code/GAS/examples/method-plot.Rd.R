library(GAS)


### Name: plot-methods
### Title: Plot output from an object of the from the GAS package.
### Aliases: plot PlotMenu

### ** Examples

## Not run: 
##D ## Plot filtered estimates of a GAS model estimated on the
##D ## Quarterly logarithmic change in percentage points of the Consumer Price Index data set (cpichg)
##D library("GAS")
##D 
##D data("cpichg")
##D 
##D GASSpec = UniGASSpec(Dist = "std", ScalingType = "Identity",
##D                      GASPar = list(location = TRUE, scale = TRUE,
##D                                    shape = FALSE))
##D 
##D Fit = UniGASFit(GASSpec, cpichg)
##D 
##D plot(Fit, which = 1)
## End(Not run)



