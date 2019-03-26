library(googleway)


### Name: add_polygons
### Title: Add polygon
### Aliases: add_polygons

### ** Examples

## Not run: 
##D 
##D map_key <- 'your_api_key'
##D 
##D ## polygon with a hole - Bermuda triangle
##D ## using one row per polygon, and a list-column of encoded polylines
##D pl_outer <- encode_pl(lat = c(25.774, 18.466,32.321),
##D       lon = c(-80.190, -66.118, -64.757))
##D 
##D pl_inner <- encode_pl(lat = c(28.745, 29.570, 27.339),
##D        lon = c(-70.579, -67.514, -66.668))
##D 
##D df <- data.frame(id = c(1, 1),
##D        polyline = c(pl_outer, pl_inner),
##D        stringsAsFactors = FALSE)
##D 
##D df <- aggregate(polyline ~ id, data = df, list)
##D 
##D google_map(key = map_key, height = 800) %>%
##D     add_polygons(data = df, polyline = "polyline")
##D 
##D ## the same polygon, but using an 'id' to specify the polygon
##D df <- data.frame(id = c(1,1),
##D        polyline = c(pl_outer, pl_inner),
##D        stringsAsFactors = FALSE)
##D 
##D google_map(key = map_key, height = 800) %>%
##D     add_polygons(data = df, polyline = "polyline", id = "id")
##D 
##D ## the same polygon, specified using coordinates, and with a second independent
##D ## polygon
##D df <- data.frame(myId = c(1,1,1,1,1,1,2,2,2),
##D       lineId = c(1,1,1,2,2,2,1,1,1),
##D       lat = c(26.774, 18.466, 32.321, 28.745, 29.570, 27.339, 22, 23, 22),
##D       lon = c(-80.190, -66.118, -64.757, -70.579, -67.514, -66.668, -50, -49, -51),
##D       colour = c(rep("#00FF0F", 6), rep("#FF00FF", 3)),
##D       stringsAsFactors = FALSE)
##D 
##D google_map(key = map_key) %>%
##D   add_polygons(data = df, lat = 'lat', lon = 'lon', id = 'myId', pathId = 'lineId',
##D                fill_colour = 'colour')
##D 
##D 
##D 
## End(Not run)




