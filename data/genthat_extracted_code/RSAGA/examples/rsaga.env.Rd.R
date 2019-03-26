library(RSAGA)


### Name: rsaga.env
### Title: Function to set up RSAGA geoprocessing environment: Set up the
###   RSAGA Geoprocessing Environment
### Aliases: rsaga.env
### Keywords: interface spatial

### ** Examples

## Not run: 
##D # Check the default RSAGA environment on your computer:
##D myenv <- rsaga.env()
##D myenv
##D # SAGA data in C:/sagadata, binaries in C:/SAGA-GIS, modules in C:/SAGA-GIS/modules:
##D myenv <- rsaga.env(workspace="C:/sagadata", path="C:/SAGA-GIS")
##D # Unix: SAGA in /usr/bin (instead of the default /usr/local/bin),
##D # and modules in /use/lib/saga:
##D # myenv <- rsaga.env(path="/usr/bin")
##D # Use the 'myenv' environment for SAGA geoprocessing:
##D rsaga.hillshade("dem","hillshade",env=myenv)
##D # ...creates (or overwrites) grid "C:/sagadata/hillshade.sgrd"
##D # derived from digital elevation model "C:/sagadata/dem.sgrd"
##D 
##D # Same calculation with different SAGA version:
##D # (I keep several versions in SAGA-GIS_2.0.x folders:)
##D myenv05 = rsaga.env(path = "C:/Progra~1/SAGA-GIS_2.0.5")
##D rsaga.hillshade("dem","hillshade205",env=myenv05)
## End(Not run)



