library(R2BayesX)


### Name: ForestHealth
### Title: Forest Health Data
### Aliases: ForestHealth forest
### Keywords: datasets

### ** Examples

## Not run: 
##D ## load zambia data and map
##D data("ForestHealth")
##D data("BeechBnd")
##D 
##D fm <- bayesx(defoliation ~  stand + fertilized + 
##D   humus + moisture + alkali + ph + soil + 
##D   sx(age) + sx(inclination) + sx(canopy) +
##D   sx(year) + sx(elevation),
##D   family = "cumlogit", method = "REML", data = ForestHealth)
##D 
##D summary(fm)
##D plot(fm, term = c("sx(age)", "sx(inclination)", 
##D   "sx(canopy)", "sx(year)", "sx(elevation)"))
## End(Not run)



