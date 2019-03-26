library(dtwSat)


### Name: twdtwCrossValidation-class
### Title: class "twdtwCrossValidation"
### Aliases: twdtwCrossValidation-class twdtwCrossValidation
###   show,twdtwCrossValidation-method summary,twdtwCrossValidation-method

### ** Examples

## Not run: 
##D # Data folder 
##D data_folder = system.file("lucc_MT/data", package = "dtwSat")
##D 
##D # Read dates 
##D dates = scan(paste(data_folder,"timeline", sep = "/"), what = "dates")
##D 
##D # Read raster time series 
##D evi = brick(paste(data_folder,"evi.tif", sep = "/"))
##D raster_timeseries = twdtwRaster(evi, timeline = dates)
##D 
##D # Read field samples 
##D field_samples = read.csv(paste(data_folder,"samples.csv", sep = "/")) 
##D table(field_samples[["label"]])
##D 
##D # Read field samples projection 
##D proj_str = scan(paste(data_folder,"samples_projection", sep = "/"), 
##D      what = "character")
##D 
##D # Get sample time series from raster time series 
##D field_samples_ts = getTimeSeries(raster_timeseries, 
##D      y = field_samples, proj4string = proj_str)
##D field_samples_ts
##D 
##D # Run cross validation
##D set.seed(1)
##D # Define TWDTW weight function 
##D log_fun = logisticWeight(alpha=-0.1, beta=50) 
##D cross_validation = twdtwCrossValidate(field_samples_ts, times=3, p=0.1, 
##D                           freq = 8, formula = y ~ s(x, bs="cc"), weight.fun = log_fun)
##D cross_validation
##D 
##D summary(cross_validation)
##D 
##D plot(cross_validation)
##D 
## End(Not run)



