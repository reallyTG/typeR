library(rgbif)


### Name: gbif_bbox2wkt
### Title: Convert a bounding box to a Well Known Text polygon, and a WKT
###   to a bounding box
### Aliases: gbif_bbox2wkt gbif_wkt2bbox

### ** Examples

## Not run: 
##D # Convert a bounding box to a WKT
##D ## Pass in a vector of length 4 with all values
##D gbif_bbox2wkt(bbox=c(-125.0,38.4,-121.8,40.9))
##D 
##D ## Or pass in each value separately
##D gbif_bbox2wkt(minx=-125.0, miny=38.4, maxx=-121.8, maxy=40.9)
##D 
##D # Convert a WKT object to a bounding box
##D wkt <- "POLYGON((-125 38.4,-125 40.9,-121.8 40.9,-121.8 38.4,-125 38.4))"
##D gbif_wkt2bbox(wkt)
## End(Not run)



