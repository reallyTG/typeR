library(horizon)


### Name: svf
### Title: Sky view factor from DEM RasterLayer
### Aliases: svf

### ** Examples

r <- getData('alt', country='ALB')

s <- svf(r, nAngles=8, maxDist=500, ll=TRUE)



