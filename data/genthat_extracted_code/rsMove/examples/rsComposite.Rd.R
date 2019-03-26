library(rsMove)


### Name: rsComposite
### Title: rsComposite
### Aliases: rsComposite

### ** Examples

## Not run: 
##D 
##D  require(raster)
##D 
##D  # read raster data
##D  file <- list.files(system.file('extdata', '', package="rsMove"), 'ndvi.tif', full.names=TRUE)
##D  r.stk <- stack(file)
##D  r.stk <- stack(r.stk, r.stk, r.stk) # dummy files for the example
##D 
##D  # raster dates
##D  file.name <- names(r.stk)
##D  x.dates <- as.Date(paste0(substr(file.name, 2, 5), '-',
##D  substr(file.name, 7, 8), '-', substr(file.name, 10, 11)))
##D 
##D  # target date
##D  obs.dates = as.Date("2013-06-01")
##D 
##D  # build composite
##D  r.comp <- rsComposite(r.stk, x.dates, obs.dates, comp.method="closest", temporal.buffer=90)
##D 
## End(Not run)



