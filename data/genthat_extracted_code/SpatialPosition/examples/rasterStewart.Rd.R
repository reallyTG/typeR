library(SpatialPosition)


### Name: rasterStewart
### Title: Create a Raster from a Stewart SpatialPointsDataFrame
### Aliases: rasterStewart

### ** Examples

data(spatData)
# Compute Stewart potentials from known points (spatPts) on a
# grid defined by its resolution
mystewart <- stewart(knownpts = spatPts, varname = "Capacite",
                     typefct = "exponential", span = 1000, beta = 3,
                     resolution = 100, mask = spatMask)
# Create a raster of potentials values
mystewartraster <- rasterStewart(x = mystewart, mask = spatMask)
plot(mystewartraster)



