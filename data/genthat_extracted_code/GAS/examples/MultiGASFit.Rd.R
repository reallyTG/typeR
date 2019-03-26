library(GAS)


### Name: MultiGASFit
### Title: Estimate multivariate GAS models
### Aliases: MultiGASFit

### ** Examples

## Not run: 
##D # Specify an GAS model with multivariate Student-t
##D # conditional distribution and time-varying scales and correlations
##D 
##D library("GAS")
##D 
##D data("StockIndices")
##D 
##D GASSpec = MultiGASSpec(Dist = "mvt", ScalingType = "Identity",
##D                        GASPar = list(scale = TRUE, correlation = TRUE))
##D 
##D Fit = MultiGASFit(GASSpec, StockIndices)
##D 
##D Fit
## End(Not run)



