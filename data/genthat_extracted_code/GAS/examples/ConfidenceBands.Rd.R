library(GAS)


### Name: ConfidenceBands
### Title: Build confidence bands for the filtered parameters
### Aliases: ConfidenceBands

### ** Examples

## Not run: 
##D 
##D # show the information of all the supported distributions
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
##D Bands = ConfidenceBands(Fit)
## End(Not run)



