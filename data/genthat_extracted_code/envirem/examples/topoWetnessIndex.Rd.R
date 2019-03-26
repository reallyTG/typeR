library(envirem)


### Name: topoWetnessIndex
### Title: Topographic Wetness Index
### Aliases: topoWetnessIndex

### ** Examples

## Not run: 
##D # Find example rasters
##D rasterFiles <- list.files(system.file('extdata', package='envirem'), full.names=TRUE)
##D elev <- raster(grep('elev', rasterFiles, value=TRUE))
##D 
##D # setting up appropriate RSAGA environment
##D sagaEnv <- RSAGA::rsaga.env(modules = '/usr/lib/x86_64-linux-gnu/saga/', cores = 2, 
##D parallel = TRUE, version = "2.2.0")
##D topoWetnessIndex(elev, sagaEnv)
## End(Not run)



