library(movecost)


### Name: movecost
### Title: R function for calculating accumulated cost of movement across
###   the terrain and least-cost paths from an origin
### Aliases: movecost
### Keywords: movecost

### ** Examples

# load a sample Digital Terrain Model
volc <- raster::raster(system.file("external/maungawhau.grd", package="gdistance"))

# load a sample start location on the above DTM
data(volc.loc)

# load the sample destination locations on the above DTM
data(destin.loc)

# calculate walking-time isochrones based on the on-path Tobler's hiking function,
# setting the time unit to hours and the isochrones interval to 0.05 hour;
# also, since destination locations are provided,
# least-cost paths from the origin to the destination locations will be calculated
# and plotted
result <- movecost(dtm=volc,origin=volc.loc, destin=destin.loc, breaks=0.05)




