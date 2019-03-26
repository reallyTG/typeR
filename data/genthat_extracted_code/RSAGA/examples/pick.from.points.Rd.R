library(RSAGA)


### Name: pick.from.points
### Title: Pick Variable from Spatial Dataset
### Aliases: pick.from.points pick.from.shapefile pick.from.ascii.grid
###   pick.from.ascii.grids internal.pick.from.ascii.grid
###   pick.from.saga.grid
### Keywords: spatial

### ** Examples

## Not run: 
##D # assume that 'dem' is an ASCII grid and d a data.frame with variables x and y
##D pick.from.ascii.grid(d, "dem")
##D # parallel processing on Windows using the doSNOW package:
##D require(doSNOW)
##D registerDoSNOW(cl <- makeCluster(2, type = "SOCK")) # DualCore processor
##D pick.from.ascii.grid(d, "dem", parallel = TRUE)
##D # produces two (ignorable) warning messages when using doSNOW
##D # typically 25-40% faster than the above on my DualCore notebook
##D stopCluster(cl)
## End(Not run)

## Not run: 
##D # use the meuse data for some tests:
##D require(gstat)
##D data(meuse)
##D data(meuse.grid)
##D meuse.nn = pick.from.points(data=meuse.grid, src=meuse,
##D     pick=c("cadmium","copper","elev"), method="nearest.neighbour")
##D meuse.kr = pick.from.points(data=meuse.grid, src=meuse,
##D     pick=c("cadmium","copper","elev"), method="krige", radius=100)
##D # it does make a difference:
##D plot(meuse.kr$cadmium,meuse.nn$cadmium)
##D plot(meuse.kr$copper,meuse.nn$copper)
##D plot(meuse.kr$elev,meuse.nn$elev)
## End(Not run)



