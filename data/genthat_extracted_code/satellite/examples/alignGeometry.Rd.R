library(satellite)


### Name: alignGeometry
### Title: Align raster geometry between two data sets
### Aliases: alignGeometry alignGeometry,Satellite-method
###   alignGeometry,Satellite-method alignGeometry,RasterStack-method
###   alignGeometry,RasterLayer-method

### ** Examples

path <- system.file("testdata/LC8", package = "satellite")
files <- list.files(path, pattern = glob2rx("LC8*.TIF"), full.names = TRUE)
sat <- satellite(files)

alignGeometry(sat, template = getSatDataLayer(sat, "B008n"), 
               band_codes = "B001n")



