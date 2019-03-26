library(rWind)


### Name: cost.FMGS
### Title: Compute flow-based cost or conductance
### Aliases: cost.FMGS flow.dispersion
### Keywords: ~anisotropy ~conductance

### ** Examples


require(gdistance)

data(wind.data)

wind <- wind2raster(wind.data)

Conductance<-flow.dispersion(wind, type="passive")

transitionMatrix(Conductance)
image(transitionMatrix(Conductance))




