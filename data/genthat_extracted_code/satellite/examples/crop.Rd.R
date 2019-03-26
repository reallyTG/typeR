library(satellite)


### Name: crop
### Title: Crop Satellite object
### Aliases: crop crop,Satellite-method

### ** Examples

## Not run: 
##D ## sample data
##D path <- system.file("extdata", package = "satellite")
##D files <- list.files(path, pattern = glob2rx("LC08*.TIF"), full.names = TRUE)
##D sat <- satellite(files)
##D 
##D ## geographic extent of georg-gassmann-stadium (utm 32-n)
##D ext_ggs <- raster::extent(484015, 484143, 5627835, 5628020)
##D 
##D ## crop satellite object by specified extent
##D sat_ggs <- crop(sat, ext_ggs)
##D 
##D plot(sat)
##D plot(sat_ggs)
## End(Not run)



