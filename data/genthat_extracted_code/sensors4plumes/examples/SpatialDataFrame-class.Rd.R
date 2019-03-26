library(sensors4plumes)


### Name: SpatialDataFrame-class
### Title: Class "SpatialDataFrame"
### Aliases: SpatialDataFrame SpatialDataFrame-class
###   coordinates,SpatialDataFrame-method
###   proj4string,SpatialDataFrame-method bbox,SpatialDataFrame-method
###   spplot,SpatialDataFrame-method length,SpatialDataFrame-method
###   is.SpatialDataFrame
### Keywords: classes

### ** Examples

# generate a SpatialPixelsDataFrame
data(meuse.grid)
gridded(meuse.grid) = ~ x + y

# extract some locations and attibutes
meuse.subgrid = subsetSDF(meuse.grid, 
        locations = c(1:45), 
        data = c("dist", "soil", "ffreq"))

# plot
spplot(meuse.subgrid, zcol = 1:2)



