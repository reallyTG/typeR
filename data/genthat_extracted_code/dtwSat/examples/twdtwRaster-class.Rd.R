library(dtwSat)


### Name: twdtwRaster-class
### Title: class "twdtwRaster"
### Aliases: twdtwRaster-class twdtwRaster twdtwRaster,ANY-method
###   twdtwRaster-create dim,twdtwRaster-method res,twdtwRaster-method
###   extent,twdtwRaster-method writeRaster,twdtwRaster,ANY-method
###   projection,twdtwRaster-method ncol,twdtwRaster-method
###   nrow,twdtwRaster-method nlayers,twdtwRaster-method
###   levels,twdtwRaster-method layers,twdtwRaster-method layers
###   coverages,twdtwRaster-method coverages bands,twdtwRaster-method bands
###   names,twdtwRaster-method index,twdtwRaster-method
###   length,twdtwRaster-method [,twdtwRaster,ANY,ANY,ANY-method
###   [[,twdtwRaster,ANY,ANY-method labels,twdtwRaster-method
###   crop,twdtwRaster-method coordinates,twdtwRaster-method
###   show,twdtwRaster-method is.twdtwRaster,ANY-method is.twdtwRaster
###   projecttwdtwRaster,twdtwRaster-method projecttwdtwRaster

### ** Examples

# Creating a new object of class twdtwTimeSeries 
evi = brick(system.file("lucc_MT/data/evi.tif", package="dtwSat"))
timeline = scan(system.file("lucc_MT/data/timeline", package="dtwSat"), what="date")
rts = new("twdtwRaster", timeseries = evi, timeline = timeline)

## Not run: 
##D # Creating objects of class twdtwRaster 
##D evi = brick(system.file("lucc_MT/data/evi.tif", package="dtwSat"))
##D timeline = scan(system.file("lucc_MT/data/timeline", package="dtwSat"), what="date")
##D ts_evi = twdtwRaster(evi, timeline=timeline)
##D 
##D ndvi = brick(system.file("lucc_MT/data/ndvi.tif", package="dtwSat"))
##D blue = brick(system.file("lucc_MT/data/blue.tif", package="dtwSat"))
##D red = brick(system.file("lucc_MT/data/red.tif", package="dtwSat"))
##D nir = brick(system.file("lucc_MT/data/nir.tif", package="dtwSat"))
##D mir = brick(system.file("lucc_MT/data/mir.tif", package="dtwSat"))
##D doy = brick(system.file("lucc_MT/data/doy.tif", package="dtwSat"))
##D rts = twdtwRaster(doy, evi, ndvi, blue, red, nir, mir, timeline = timeline)
## End(Not run)



