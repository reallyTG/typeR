library(mapi)


### Name: MAPI_RunAuto
### Title: Function MAPI_RunAuto
### Aliases: MAPI_RunAuto

### ** Examples

## Not run: 
##D data("metric")
##D data("samples")
##D # Run a MAPI analysis without permutation
##D my.results <- MAPI_RunAuto(samples, metric, crs=3857, beta=0.5, nbPermuts=0)
##D 
##D # eg. Export results to shapefile "myFirstMapiResult" in current directory
##D # to further visualize and customize the MAPI plot in SIG software.
##D library(sf)
##D st_write(my.results, dsn=".", layer="myFirstMapiResult", driver="ESRI Shapefile")
## End(Not run)




