library(dtwSat)


### Name: twdtwXtable
### Title: LaTeX table from accuracy metrics
### Aliases: twdtwXtable twdtwXtable,twdtwAssessment-method
###   twdtwXtable-twdtwAssessment twdtwXtable,twdtwCrossValidation-method
###   twdtwXtable-twdtwCrossValidation

### ** Examples

## Not run: 
##D 
##D # Create raster time series
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
##D # Read field samples 
##D field_samples = read.csv(system.file("lucc_MT/data/samples.csv", package="dtwSat"))
##D proj_str = scan(system.file("lucc_MT/data/samples_projection", 
##D                 package="dtwSat"), what = "character")
##D 
##D # Split samples for training (10%) and validation (90%) using stratified sampling 
##D library(caret) 
##D set.seed(1)
##D I = unlist(createDataPartition(field_samples$label, p = 0.1))
##D training_samples = field_samples[I,]
##D validation_samples = field_samples[-I,]
##D 
##D # Create temporal patterns 
##D training_ts = getTimeSeries(rts, y = training_samples, proj4string = proj_str)
##D temporal_patterns = createPatterns(training_ts, freq = 8, formula = y ~ s(x))
##D 
##D # Run TWDTW analysis for raster time series 
##D log_fun = weight.fun=logisticWeight(-0.1,50)
##D r_twdtw = twdtwApply(x=rts, y=temporal_patterns, weight.fun=log_fun, format="GTiff", 
##D                      overwrite=TRUE)
##D                      
##D # Classify raster based on the TWDTW analysis 
##D r_lucc = twdtwClassify(r_twdtw, format="GTiff", overwrite=TRUE)
##D plot(r_lucc)
##D 
##D # Assess classification 
##D twdtw_assess = twdtwAssess(object = r_lucc, y = validation_samples, 
##D                            proj4string = proj_str, conf.int=.95) 
##D twdtw_assess
##D 
##D # Create latex tables 
##D twdtwXtable(twdtw_assess, table.type="errormatrix", rotate.col=TRUE,
##D   caption="Error matrix", digits=2, comment=FALSE)
##D twdtwXtable(twdtw_assess, table.type="accuracy", category.type="letter", 
##D   caption="Accuracy metrics.")
##D twdtwXtable(twdtw_assess, table.type="area", category.type="letter",
##D   digits = 0, caption="Area and uncertainty")
##D 
## End(Not run)



