library(envirem)


### Name: dataTypeCheck
### Title: Data Type Check
### Aliases: dataTypeCheck

### ** Examples

rasterFiles <- list.files(system.file('extdata', package='envirem'), full.names=TRUE)
r <- raster(rasterFiles[1])
dataTypeCheck(r)



