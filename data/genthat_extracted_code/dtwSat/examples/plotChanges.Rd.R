library(dtwSat)


### Name: plotChanges
### Title: Plotting changes
### Aliases: plotChanges

### ** Examples

## Not run: 
##D # Run TWDTW analysis for raster time series 
##D patt = MOD13Q1.MT.yearly.patterns
##D evi = brick(system.file("lucc_MT/data/evi.tif", package="dtwSat"))
##D ndvi = brick(system.file("lucc_MT/data/ndvi.tif", package="dtwSat"))
##D red = brick(system.file("lucc_MT/data/red.tif", package="dtwSat"))
##D blue = brick(system.file("lucc_MT/data/blue.tif", package="dtwSat"))
##D nir = brick(system.file("lucc_MT/data/nir.tif", package="dtwSat"))
##D mir = brick(system.file("lucc_MT/data/mir.tif", package="dtwSat"))
##D doy = brick(system.file("lucc_MT/data/doy.tif", package="dtwSat"))
##D timeline = scan(system.file("lucc_MT/data/timeline", package="dtwSat"), what="date")
##D rts = twdtwRaster(evi, ndvi, red, blue, nir, mir, timeline = timeline, doy = doy)
##D 
##D time_interval = seq(from=as.Date("2007-09-01"), to=as.Date("2013-09-01"), 
##D                     by="12 month")
##D log_fun = weight.fun=logisticWeight(-0.1,50)
##D 
##D r_twdtw = twdtwApply(x=rts, y=patt, weight.fun=log_fun, breaks=time_interval, 
##D           filepath="~/test_twdtw", overwrite=TRUE, format="GTiff")
##D 
##D r_lucc = twdtwClassify(r_twdtw, format="GTiff", overwrite=TRUE)
##D 
##D plotChanges(r_lucc)
##D 
## End(Not run)



