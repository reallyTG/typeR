library(envirem)


### Name: monthCountByTemp
### Title: Month count by temperature
### Aliases: monthCountByTemp

### ** Examples

# Find example rasters
rasterFiles <- list.files(system.file('extdata', package='envirem'), full.names=TRUE)
env <- stack(rasterFiles)

# identify the appropriate layers
meantemp <- grep('mean', names(env), value=TRUE)
meantemp <- env[[meantemp]]
monthCountByTemp(meantemp, 10, tempScale = 10)



