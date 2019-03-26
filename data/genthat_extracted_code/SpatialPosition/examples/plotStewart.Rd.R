library(SpatialPosition)


### Name: plotStewart
### Title: Plot a Stewart Raster
### Aliases: plotStewart

### ** Examples

data(spatData)
# Compute Stewart potentials from known points (spatPts) on a
# grid defined by its resolution
mystewart <- stewart(knownpts = spatPts, varname = "Capacite",
                     typefct = "exponential", span = 1000, beta = 3,
                     resolution = 100, mask = spatMask)
# Create a raster of potentials values
mystewartraster <- rasterStewart(x = mystewart, mask = spatMask)
# Plot stewart potentials nicely
plotStewart(x = mystewartraster, add = FALSE, nclass = 5)
# Can be used to obtain break values
break.values <- plotStewart(x = mystewartraster, add = FALSE, nclass = 5)
break.values



