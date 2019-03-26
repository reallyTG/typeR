library(satellite)


### Name: calcTopoCorr
### Title: Correct for topographic effects.
### Aliases: calcTopoCorr calcTopoCorr,Satellite-method
###   calcTopoCorr,RasterStackBrick-method calcTopoCorr,RasterLayer-method

### ** Examples

path <- system.file("extdata", package = "satellite")
files <- list.files(path, pattern = glob2rx("LC08*.TIF"), full.names = TRUE)
sat <- satellite(files)

## dem

files_dem <- list.files(path, pattern = "DEM", full.names = TRUE)
DEM <- raster(files_dem)

sat <- addSatDataLayer(sat, data = DEM, info = NULL, bcde = "DEM", in_bcde="DEM")

## Not run: 
##D sat <- calcTopoCorr(sat)
## End(Not run)



