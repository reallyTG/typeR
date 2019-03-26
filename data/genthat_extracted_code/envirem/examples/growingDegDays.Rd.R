library(envirem)


### Name: growingDegDays
### Title: Growing degree days
### Aliases: growingDegDays

### ** Examples

# Find example rasters
rasterFiles <- list.files(system.file('extdata', package='envirem'), full.names=TRUE)
env <- stack(rasterFiles)

meantemp <- env[[grep('tmean', names(env), value=TRUE)]]
growingDegDays(meantemp, 10, tempScale = 10)



