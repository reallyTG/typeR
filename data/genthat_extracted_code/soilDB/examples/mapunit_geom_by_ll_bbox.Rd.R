library(soilDB)


### Name: mapunit_geom_by_ll_bbox
### Title: Fetch Map Unit Geometry from SDA
### Aliases: mapunit_geom_by_ll_bbox
### Keywords: manip

### ** Examples

# fetch map unit geometry from a bounding-box:
# 
#         +------------- (-120.41, 38.70)
#         |                     |
#         |                     |
# (-120.54, 38.61) --------------+

## Not run: 
##D # basic usage
##D b <- c(-120.54,38.61,-120.41,38.70)
##D x <- mapunit_geom_by_ll_bbox(b) # about 20 seconds
##D 
##D # note that the returned geometry is everything overlapping the bbox
##D # and not an intersection... why?
##D plot(x)
##D rect(b[1], b[2], b[3], b[4], border='red', lwd=2)
##D 
##D 
##D # get map unit data for matching map unit keys
##D in.statement <- format_SQL_in_statement(unique(x$MUKEY))
##D q <- paste("SELECT mukey, muname FROM mapunit WHERE mukey IN ", in.statement, sep="")
##D res <- SDA_query(q)
## End(Not run)



