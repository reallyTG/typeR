library(googlePolylines)


### Name: wkt_polyline
### Title: WKT Polyline
### Aliases: wkt_polyline

### ** Examples

## Not run: 
##D 
##D library(sf)
##D nc <- sf::st_read(system.file("shape/nc.shp", package="sf"))
##D 
##D ## encode to polylines
##D enc <- encode(nc)
##D 
##D ## convert encoded lines to well-known text
##D wkt <- polyline_wkt(enc)
##D 
##D ## convert well-known text back to polylines
##D enc2 <- wkt_polyline(wkt)
##D 
## End(Not run)




