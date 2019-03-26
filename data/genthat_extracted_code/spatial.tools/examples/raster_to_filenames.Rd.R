library(spatial.tools)


### Name: raster_to_filenames
### Title: Extract filenames from all Raster* objects.
### Aliases: raster_to_filenames

### ** Examples

{ 
library("raster")
tahoe_highrez <- brick(system.file("external/tahoe_highrez.tif", package="spatial.tools"))
raster_to_filenames(tahoe_highrez)
raster_to_filenames(tahoe_highrez,unique=TRUE)
nodata <- raster()
raster_to_filenames(nodata)
}



