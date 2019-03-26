library(satellite)


### Name: extend
### Title: Extend a Satellite object
### Aliases: extend extend,Satellite-method

### ** Examples

## Not run: 
##D ## sample data
##D path <- system.file("extdata", package = "satellite")
##D files <- list.files(path, pattern = glob2rx("LC08*.TIF"), full.names = TRUE)
##D sat <- satellite(files)
##D 
##D ## geographic extent of georg-gassmann-stadium (utm 32-n)
##D ext_ggs <- raster::extent(482606.4, 482781.4, 5627239, 5627489)
##D 
##D ## extend satellite object by specified extent
##D sat_ggs <- extend(sat, ext_ggs)
##D 
##D plot(sat)
##D plot(sat_ggs)
## End(Not run)



