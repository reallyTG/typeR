library(satellite)


### Name: satellite
### Title: Create a Satellite object
### Aliases: satellite satellite,character-method satellite,Raster-method
###   satellite,list-method

### ** Examples

## 'character' input (i.e. filenames)
path <- system.file("extdata", package = "satellite")
files <- list.files(path, pattern = glob2rx("LC08*.TIF"), full.names = TRUE)

satellite(files)

## raster::RasterStack input
satellite(l8)




