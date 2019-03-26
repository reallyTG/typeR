library(dtwSat)


### Name: createPatterns
### Title: Create patterns
### Aliases: createPatterns createPatterns,twdtwTimeSeries-method
###   createPatterns-twdtwMatches

### ** Examples

# Creating patterns from objects of class twdtwTimeSeries 
evi = brick(system.file("lucc_MT/data/evi.tif", package="dtwSat"))
ndvi = brick(system.file("lucc_MT/data/ndvi.tif", package="dtwSat"))
timeline = scan(system.file("lucc_MT/data/timeline", package="dtwSat"), what="date")
rts = twdtwRaster(evi, ndvi, timeline=timeline)

# Read field samples 
## Not run: 
##D field_samples = read.csv(system.file("lucc_MT/data/samples.csv", package="dtwSat"))
##D prj_string = scan(system.file("lucc_MT/data/samples_projection", package="dtwSat"), 
##D                   what = "character")
##D 
##D # Extract time series 
##D ts = getTimeSeries(rts, y = field_samples, proj4string = prj_string)
##D 
##D # Create temporal patterns 
##D patt = createPatterns(x=ts, from="2005-09-01", to="2006-09-01", freq=8, formula = y~s(x))
##D 
##D # Plot patterns 
##D autoplot(patt[[1]], facets = NULL) + xlab("Time") + ylab("Value")
##D 
## End(Not run)



