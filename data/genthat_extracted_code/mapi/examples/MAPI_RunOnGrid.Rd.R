library(mapi)


### Name: MAPI_RunOnGrid
### Title: Function MAPI_RunOnGrid
### Aliases: MAPI_RunOnGrid

### ** Examples

## Not run: 
##D data(metric)
##D data(samples)
##D my.grid <- MAPI_GridHexagonal(samples, crs=3857, 500) # 500m halfwidth
##D 
##D # Note: 10 permutations is only for test purpose, increase to >=1000 in real life!
##D my.results <- MAPI_RunOnGrid(samples, metric, grid=my.grid, nbPermuts=10, nbCores=1)
##D 
##D # eg. Export results to shapefile "myFirstMapiResult" in current directory
##D library(sf)
##D st_write(my.results, dsn=".", layer="myFirstMapiResult", driver="ESRI Shapefile")
## End(Not run)




