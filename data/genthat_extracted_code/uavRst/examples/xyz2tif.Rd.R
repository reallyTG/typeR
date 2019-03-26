library(uavRst)


### Name: xyz2tif
### Title: Read and Convert xyz DEM/DSM Data as typically provided by the
###   Authorities.
### Aliases: xyz2tif

### ** Examples

## Not run: 
##D ##- libraries
##D require(uavRst)
##D owd <- getwd()
##D setwd(tempdir())
##D ##- get typical xyz DEM data in this case from the Bavarian authority 
##D utils::download.file("http://www.ldbv.bayern.de/file/zip/10430/DGM_1_ascii.zip",
##D                     "testdata.zip")
##D file<- unzip("testdata.zip",list = TRUE)$Name[2]
##D unzip("testdata.zip",files = file,  overwrite = TRUE)
##D ##- show structure
##D head(read.table(file))
##D ##- create tiff file
##D ##- NOTE  for creating a geotiff you have to provide the correct EPSG code from the meta data
##D xyz2tif(file,epsgCode = "31468")
##D 
##D ##- visualize it
##D raster::plot(raster::raster(file))
##D setwd(owd)
## End(Not run)




