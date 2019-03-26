library(ENiRG)


### Name: stdz.maps
### Title: Standardization of raster maps
### Aliases: stdz.maps
### Keywords: standardization raster

### ** Examples

## Not run: 
##D # starting GRASS session
##D # initGRASS("/usr/bin/grass-7.0.0", home=tempdir())
##D # initGRASS("C:/GRASS", home=tempdir())
##D 
##D ## Path to the file to be imported
##D file1 <- paste(system.file(package = "ENiRG"), "/ext/tann.asc", sep="")
##D 
##D import.egvs(file1, "tann")
##D 
##D stdz.maps("tann","std_tann")
##D 
## End(Not run)



