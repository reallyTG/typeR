library(SpatialPosition)


### Name: rasterReilly
### Title: Create a Raster from a Reilly SpatialPointsDataFrame
### Aliases: rasterReilly

### ** Examples

data(spatData)
row.names(spatPts) <- spatPts$CodHop
# Compute Reilly catchment areas from known points (spatPts) on a
# grid defined by its resolution
myreilly <- reilly(knownpts = spatPts, varname = "Capacite",
                   typefct = "exponential", span = 750, beta = 2,
                   resolution = 100, mask = spatMask)
# Create a raster of reilly values
myreillyraster <- rasterReilly(x = myreilly, mask = spatMask)
plot(myreillyraster, col = rainbow(18))
# Correspondance between raster values and reilly areas
head(unique(levels(myreillyraster)[[1]]))



