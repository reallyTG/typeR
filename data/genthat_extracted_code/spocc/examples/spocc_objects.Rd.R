library(spocc)


### Name: spocc_objects
### Title: spocc objects and their print, plot, and summary methods
### Aliases: spocc_objects print.occdat print.occdatind summary.occdat
###   summary.occdatind print.occnames
### Keywords: internal

### ** Examples

## Not run: 
##D # occdat object
##D res <- occ(query = 'Accipiter striatus', from = 'gbif')
##D res
##D print(res)
##D class(res)
##D 
##D # occdatind object
##D res$gbif
##D print(res$gbif)
##D class(res$gbif)
##D 
##D # print summary of occdat object
##D summary(res)
##D 
##D # print summary of occdatind object
##D summary(res$gbif)
##D 
##D # Geometry based searches print slightly differently
##D bounds <- c(-120, 40, -100, 45)
##D (res <- occ(from = "idigbio", geometry = bounds, limit = 10))
##D res$idigbio
##D ## Many bounding boxes/WKT strings
##D bounds <- list(c(165,-53,180,-29), c(-180,-53,-175,-29))
##D res <- occ(from = "idigbio", geometry = bounds, limit = 10)
##D res$idigbio
## End(Not run)



