library(SpatialPosition)


### Name: plotReilly
### Title: Plot a Reilly Raster
### Aliases: plotReilly

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
# Plot the raster nicely
plotReilly(x = myreillyraster)



