library(envirem)


### Name: split_raster
### Title: Split raster into tiles
### Aliases: split_raster

### ** Examples

## Not run: 
##D # Find example rasters
##D rasterFiles <- list.files(system.file('extdata', package='envirem'), full.names=TRUE)
##D bio1file <- grep('bio_1\\.', rasterFiles, value=TRUE)
##D 
##D We will split this raster into 4 tiles, that will be written to disk.
##D split_raster(bio1file, s = 2, outputDir = '~/temp/', gdalinfoPath = NULL, gdal_translatePath = NULL)
## End(Not run)



