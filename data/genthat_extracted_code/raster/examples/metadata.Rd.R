library(raster)


### Name: metadata
### Title: Metadata
### Aliases: metadata metadata<-
### Keywords: spatial

### ** Examples
 
r <- raster(nc=10, nr=10)
r[] <- 1:ncell(r)

m <- list(wave=list(a=1, b=2, c=c('cool', 'important')), that=list(red='44', blue=1:5,
       days=as.Date(c('2014-1-15','2014-2-15'))), this='888 miles from here', today=NA)

metadata(r) <- m
x <- writeRaster(r, 'test.grd', overwrite=TRUE)
metax <- metadata(x)

identical(metax, m)

## Not run: 
##D # nested too deep
##D badmeta1 <- list(wave=list(a=1, b=2, c='x'), that=list(red='4', blue=list(bad=5)))
##D metadata(r) <- badmeta1
##D 
##D # missing names
##D badmeta2 <- list(wave=list(1, 2, c='x'), that=list(red='44', blue=14), this='8m')
##D metadata(r) <- badmeta2
##D 
##D # matrix not allowed
##D badmeta3 <- list(wave=list(a=1, b=matrix(1:4, ncol=2), c='x'), that=list(red='4'))
##D metadata(r) <- badmeta3
## End(Not run)



