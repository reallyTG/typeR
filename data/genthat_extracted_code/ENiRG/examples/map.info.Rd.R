library(ENiRG)


### Name: map.info
### Title: Retrieve metadata of a raster file from current GRASS location.
### Aliases: map.info
### Keywords: metadata raster map

### ** Examples

## Not run: 
##D # starting GRASS session
##D initGRASS("/usr/bin/grass-7.0.0", home=tempdir())
##D initGRASS("C:/GRASS", home=tempdir())
##D 
##D ## Path to file
##D file1 <- paste(system.file(package = "ENiRG"),"/ext/tann.asc", sep="")
##D import.egvs(file1, "tann")
##D 
##D map.info("tann", format="r")
##D 
## End(Not run)



