library(SpatialPosition)


### Name: rasterHuff
### Title: Create a Raster from a Huff SpatialPointsDataFrame
### Aliases: rasterHuff

### ** Examples

data(spatData)
# Compute Huff catchment areas from known points (spatPts) on a
# grid defined by its resolution
myhuff <- huff(knownpts = spatPts, varname = "Capacite",
               typefct = "exponential", span = 750, beta = 2,
               resolution = 100, mask = spatMask)
# Create a raster of huff values
myhuffraster <- rasterHuff(x = myhuff, mask = spatMask)
plot(myhuffraster)



