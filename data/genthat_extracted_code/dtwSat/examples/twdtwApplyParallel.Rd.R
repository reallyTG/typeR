library(dtwSat)


### Name: twdtwApplyParallel
### Title: Apply TWDTW analysis to twdtwRaster using parallel processing
### Aliases: twdtwApplyParallel twdtwApplyParallel,twdtwRaster-method
###   twdtwApplyParallel-twdtwRaster

### ** Examples

## Not run: 
##D   
##D # Example of TWDTW analysis using raster files 
##D library(dtwSat)
##D library(caret) 
##D 
##D # Load raster data 
##D evi  <- brick(system.file("lucc_MT/data/evi.tif",  package = "dtwSat"))
##D ndvi <- brick(system.file("lucc_MT/data/ndvi.tif", package = "dtwSat"))
##D red  <- brick(system.file("lucc_MT/data/red.tif",  package = "dtwSat"))
##D blue <- brick(system.file("lucc_MT/data/blue.tif", package = "dtwSat"))
##D nir  <- brick(system.file("lucc_MT/data/nir.tif",  package = "dtwSat"))
##D mir  <- brick(system.file("lucc_MT/data/mir.tif",  package = "dtwSat"))
##D doy  <- brick(system.file("lucc_MT/data/doy.tif",  package = "dtwSat"))
##D timeline <- 
##D   scan(system.file("lucc_MT/data/timeline", package = "dtwSat"), what="date")
##D 
##D # Create raster time series 
##D rts <- twdtwRaster(evi, ndvi, red, blue, nir, mir, timeline = timeline, doy = doy)
##D 
##D # Load field samples and projection 
##D field_samples <- 
##D   read.csv(system.file("lucc_MT/data/samples.csv", package = "dtwSat"))
##D proj_str <- 
##D   scan(system.file("lucc_MT/data/samples_projection", package = "dtwSat"), 
##D        what = "character")
##D 
##D # Split samples for training (10%) and validation (90%) using stratified sampling 
##D set.seed(1)
##D I <- unlist(createDataPartition(field_samples$label, p = 0.1))
##D training_samples <- field_samples[I, ]
##D validation_samples <- field_samples[-I, ]
##D 
##D # Get time series form raster
##D training_ts <- getTimeSeries(rts, y = training_samples, proj4string = proj_str)
##D validation_ts <- getTimeSeries(rts, y = validation_samples, proj4string = proj_str)
##D 
##D # Create temporal patterns 
##D temporal_patterns <- createPatterns(training_ts, freq = 8, formula = y ~ s(x))
##D 
##D # Set TWDTW weight function 
##D log_fun <- logisticWeight(-0.1, 50)
##D 
##D # Run serial TWDTW analysis 
##D r_twdtw <-
##D   twdtwApply(x = rts, y = temporal_patterns, weight.fun = log_fun, progress = 'text')
##D 
##D # or Run parallel TWDTW analysis
##D beginCluster()
##D r_twdtw <- 
##D   twdtwApplyParallel(x = rts, y = temporal_patterns, weight.fun = log_fun, progress = 'text')
##D endCluster()
##D 
##D # Plot TWDTW distances for the first year 
##D plot(r_twdtw, type = "distance", time.levels = 1)
##D 
##D # Classify raster based on the TWDTW analysis 
##D r_lucc <- twdtwClassify(r_twdtw, progress = 'text')
##D 
##D # Plot TWDTW classification results 
##D plot(r_lucc, type = "map")
##D 
##D # Assess classification 
##D twdtw_assess <- 
##D   twdtwAssess(object = r_lucc, y = validation_samples, 
##D               proj4string = proj_str, conf.int = .95) 
##D 
##D # Plot map accuracy 
##D plot(twdtw_assess, type = "accuracy")
##D 
##D # Plot area uncertainty 
##D plot(twdtw_assess, type = "area")
##D 
##D # Plot misclassified samples  
##D plot(twdtw_assess, type = "map", samples = "incorrect") 
##D 
##D # Get latex table with error matrix 
##D twdtwXtable(twdtw_assess, table.type = "matrix")
##D 
##D # Get latex table with error accuracy 
##D twdtwXtable(twdtw_assess, table.type = "accuracy")
##D 
##D # Get latex table with area uncertainty 
##D twdtwXtable(twdtw_assess, table.type = "area")
##D 
## End(Not run)




