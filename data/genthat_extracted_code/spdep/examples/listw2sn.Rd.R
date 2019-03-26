library(spdep)


### Name: listw2sn
### Title: Spatial neighbour sparse representation
### Aliases: listw2sn sn2listw as.spam.listw
### Keywords: spatial

### ** Examples

if (require(rgdal, quietly=TRUE)) {
example(columbus)
col.listw <- nb2listw(col.gal.nb)
col.listw$neighbours[[1]]
col.listw$weights[[1]]
col.sn <- listw2sn(col.listw)
str(col.sn)
## Not run: 
##D col.sp <- as.spam.listw(col.listw)
##D str(col.sp)
## End(Not run)
}



