library(envirem)


### Name: thermicityIndex
### Title: Compensated Thermicity index
### Aliases: thermicityIndex

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
temp <- otherTempExtremes(tmean, tmin, tmax)

ci <- continentality(temp[['meanTempWarmest']], temp[['meanTempColdest']], tempScale = 10)

# compensated thermicity index
thermicityIndex(env[['bio_1']], env[['bio_6']], temp[['maxTempColdest']], ci, tempScale = 10)
## End(No test)



