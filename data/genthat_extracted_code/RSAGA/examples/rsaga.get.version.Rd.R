library(RSAGA)


### Name: rsaga.get.version
### Title: Determine SAGA GIS version
### Aliases: rsaga.get.version
### Keywords: interface spatial

### ** Examples

## Not run: 
##D myenv <- rsaga.env()
##D myenv$version
##D # rsaga.env actually calls rsaga.get.version:
##D rsaga.get.version()
##D 
##D # I keep several versions of SAGA GIS in SAGA-GIS_2.0.x folders:
##D myenv05 = rsaga.env(path = "C:/Progra~1/SAGA-GIS_2.0.5", version = NA)
##D # Check if it's really version 2.0.5 as suggested by the folder name:
##D rsaga.get.version(env = myenv05)
## End(Not run)



