library(envirem)


### Name: otherTempExtremes
### Title: Temperature Extremes
### Aliases: otherTempExtremes

### ** Examples

## No test: 
# Find example rasters
rasterFiles <- list.files(system.file('extdata', package='envirem'), full.names=TRUE)
env <- stack(rasterFiles)

# identify appropriate layers
tmean <- grep('tmean', names(env))
tmin <- grep('tmin', names(env))
tmax <- grep('tmax', names(env))

tmean <- env[[tmean]]
tmin <- env[[tmin]]
tmax <- env[[tmax]]

# calculate temperature extremes
otherTempExtremes(tmean, tmin, tmax)
## End(No test)



