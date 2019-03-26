library(medfate)


### Name: spwb.ldrOptimization
### Title: Optimization of root distribution
### Aliases: spwb.ldrOptimization

### ** Examples

## Not run: 
##D #Load example daily meteorological data
##D data(examplemeteo)
##D 
##D #Load example plot plant data
##D data(exampleforest)
##D 
##D #Default species parameterization
##D data(SpParamsMED)
##D 
##D #Initialize soil with default soil params
##D examplesoil = soil(defaultSoilParams(2))
##D 
##D #Initialize control parameters
##D control = defaultControl()
##D 
##D #Initialize input
##D x = forest2spwbInput(exampleforest,examplesoil, SpParamsMED, control)
##D 
##D #Run optimization
##D spwb.ldrOptimization(x = x, soil = examplesoil, meteo = examplemeteo, 
##D                      psi_crit = c(-2,-3,-4), elevation = 100)
## End(Not run)




