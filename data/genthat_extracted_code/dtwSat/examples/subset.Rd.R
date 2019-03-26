library(dtwSat)


### Name: subset
### Title: Subset time series
### Aliases: subset subset,twdtwTimeSeries-method subset-twdtwTimeSeries
###   subset,twdtwMatches-method subset-twdtwMatches
###   subset,twdtwRaster-method subset-twdtwRaster

### ** Examples

# Getting time series from objects of class twdtwTimeSeries
ts = twdtwTimeSeries(MOD13Q1.ts.list)
ts = subset(ts, 2)
ts
# Getting time series from objects of class twdtwTimeSeries
patt = twdtwTimeSeries(MOD13Q1.patterns.list)
mat = twdtwApply(x=ts, y=patt, weight.fun=logisticWeight(-0.1,100))
mat = subset(mat, k=4)

## This example creates a twdtwRaster object and extracts time series from it. 

# Creating objects of class twdtwRaster with evi and ndvi time series 
evi = brick(system.file("lucc_MT/data/evi.tif", package="dtwSat"))
ndvi = brick(system.file("lucc_MT/data/ndvi.tif", package="dtwSat"))
timeline = scan(system.file("lucc_MT/data/timeline", package="dtwSat"), what="date")
rts = twdtwRaster(evi, ndvi, timeline=timeline)

rts_evi = subset(rts, layers="evi")

field_samples = read.csv(system.file("lucc_MT/data/samples.csv", package="dtwSat"))
prj_string = scan(system.file("lucc_MT/data/samples_projection", package="dtwSat"), 
                  what = "character")

# Extract time series 
ts_evi = getTimeSeries(rts_evi, y = field_samples, proj4string = prj_string)

# Subset all labels = "Forest"
ts_forest = subset(ts_evi, labels="Forest")




