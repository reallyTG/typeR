library(satellite)


### Name: demTools
### Title: Compute terrain characteristics from digital elevation models
### Aliases: demTools demTools,Satellite-method demTools,RasterLayer-method

### ** Examples

path <- system.file("extdata", package = "satellite")
files <- list.files(path, pattern = glob2rx("LC08*.TIF"), full.names = TRUE)
sat <- satellite(files)

## dem
files_dem <- list.files(path, pattern = "DEM", full.names = TRUE)
DEM <- raster(files_dem)

sat <- addSatDataLayer(sat, data = DEM, info = NULL, bcde = "DEM", in_bcde="DEM")
sat <- demTools(sat)



