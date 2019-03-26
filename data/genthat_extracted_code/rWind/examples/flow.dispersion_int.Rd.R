library(rWind)


### Name: flow.dispersion_int
### Title: Compute flow-based cost or conductance
### Aliases: flow.dispersion_int
### Keywords: internal ~anisotropy ~conductance

### ** Examples


data(wind.data)
wind <- wind2raster(wind.data)
Conductance <- flow.dispersion(wind, type="passive")

## Not run: 
##D require(gdistance)
##D transitionMatrix(Conductance)
##D image(transitionMatrix(Conductance))
## End(Not run)



