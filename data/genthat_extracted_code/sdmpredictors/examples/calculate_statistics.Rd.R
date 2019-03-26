library(sdmpredictors)


### Name: calculate_statistics
### Title: Calculate statistics for a given raster.
### Aliases: calculate_statistics

### ** Examples

## Not run: 
##D # calculate statistics of the SST and salinity in the Baltic Sea
##D 
##D # warning using tempdir() implies that data will be downloaded again in the 
##D # next R session
##D x <- load_layers(c("BO_sstmax", "BO_salinity"), datadir = tempdir())
##D e <- extent(13, 31, 52, 66)
##D baltics <- crop(x, e)
##D View(rbind(calculate_statistics("SST Baltic Sea", raster(x, layer = 1)))
##D            calculate_statistics("Salinity Baltic Sea", raster(x, layer = 2)))
## End(Not run)



