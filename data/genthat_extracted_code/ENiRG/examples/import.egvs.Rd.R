library(ENiRG)


### Name: import.egvs
### Title: Raster file importation
### Aliases: import.egvs
### Keywords: raster map

### ** Examples

## Not run: 
##D # starting GRASS session
##D initGRASS("/usr/bin/grass-7.0.0", home=tempdir())
##D initGRASS("C:/GRASS", home=tempdir())
##D 
##D ## Path to file
##D file1 <- paste(system.file(package = "ENiRG"), "/ext/tann.asc", sep="")
##D 
##D import.egvs(file1, "tann")
##D 
##D list.maps()
##D 
## End(Not run)



