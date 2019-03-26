library(sensors4plumes)


### Name: changeSimulationsPath
### Title: Reset file paths in Simulations objects
### Aliases: changeSimulationsPath

### ** Examples

# if data are taken from files, the paths need to be updated
## Not run: 
##D library(sensors4plumesData)
##D data(radioactivePlumes_area)
##D radioactivePlumes_area = changeSimulationsPath(radioactivePlumes_area,
##D c(paste0(path.package("sensors4plumesData"),
##D           "/extdata/radioactivePlumes_area_finaldose.grd"),
##D   paste0(path.package("sensors4plumesData"),
##D           "/extdata/radioactivePlumes_area_maxdose.grd"),
##D   paste0(path.package("sensors4plumesData"),
##D           "/extdata/radioactivePlumes_area_time.grd"))
##D )
## End(Not run)




