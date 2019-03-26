library(dtwSat)


### Name: getTimeSeries
### Title: Get time series from twdtw* objects
### Aliases: getTimeSeries getPatterns getTimeSeries,twdtwTimeSeries-method
###   getTimeSeries-twdtwTimeSeries getTimeSeries,twdtwMatches-method
###   getTimeSeries-twdtwMatches getPatterns,twdtwMatches-method
###   getPatterns-twdtwMatches getTimeSeries,twdtwRaster-method
###   getTimeSeries-twdtwRaster

### ** Examples

# Getting time series from objects of class twdtwTimeSeries
ts = twdtwTimeSeries(MOD13Q1.ts.list)
getTimeSeries(ts, 2)
# Getting time series from objects of class twdtwTimeSeries
ts = twdtwTimeSeries(MOD13Q1.ts.list)
patt = twdtwTimeSeries(MOD13Q1.patterns.list)
mat = twdtwApply(x=ts, y=patt)
getTimeSeries(mat, 2)

## This example creates a twdtwRaster object and extract time series from it. 

# Creating objects of class twdtwRaster with evi and ndvi time series 
evi = brick(system.file("lucc_MT/data/evi.tif", package="dtwSat"))
ndvi = brick(system.file("lucc_MT/data/ndvi.tif", package="dtwSat"))
timeline = scan(system.file("lucc_MT/data/timeline", package="dtwSat"), what="date")
rts = twdtwRaster(evi, ndvi, timeline=timeline)

# Location and time range 
ts_location = data.frame(longitude = -55.96957, latitude = -12.03864, 
                         from = "2007-09-01", to = "2013-09-01")
prj_string = "+proj=longlat +datum=WGS84 +no_defs +ellps=WGS84 +towgs84=0,0,0"

# Extract time series 
ts = getTimeSeries(rts, y = ts_location, proj4string = prj_string)
 
autoplot(ts[[1]], facets = NULL) + xlab("Time") + ylab("Value")




