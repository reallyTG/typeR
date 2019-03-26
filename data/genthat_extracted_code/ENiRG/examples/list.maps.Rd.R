library(ENiRG)


### Name: list.maps
### Title: List available raster and/or vector maps
### Aliases: list.maps
### Keywords: vector raster metadata GRASS

### ** Examples

## Not run: 
##D # starting GRASS session
##D initGRASS("/usr/bin/grass-7.0.0", home=tempdir())
##D initGRASS("C:/GRASS", home=tempdir())
##D 
##D ## Path of the files to be read
##D predictor.names <- c("tann", "mntcm", "mxtwm", "rfann", "rfdm", "rfwm")
##D file.names <- paste(system.file(package = "ENiRG"),
##D                     "/ext/", predictor.names, ".asc", sep="")
##D 
##D import.egvs(file.names, predictor.names)
##D 
##D list.maps("rf*")
##D list.maps("*ann")
## End(Not run)



