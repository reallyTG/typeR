library(googleway)


### Name: update_polygons
### Title: Update polygons
### Aliases: update_polygons

### ** Examples

## Not run: 
##D 
##D map_key <- 'your_api_key'
##D 
##D pl_outer <- encode_pl(lat = c(25.774, 18.466,32.321),
##D                       lon = c(-80.190, -66.118, -64.757))
##D 
##D pl_inner <- encode_pl(lat = c(28.745, 29.570, 27.339),
##D                       lon = c(-70.579, -67.514, -66.668))
##D 
##D pl_other <- encode_pl(c(21,23,22), c(-50, -49, -51))
##D 
##D ## using encoded polylines
##D df <- data.frame(id = c(1,1,2),
##D                  colour = c("#00FF00", "#00FF00", "#FFFF00"),
##D                  polyline = c(pl_outer, pl_inner, pl_other),
##D                  stringsAsFactors = FALSE)
##D 
##D google_map(key = map_key) %>%
##D   add_polygons(data = df, polyline = 'polyline', id = 'id', fill_colour = 'colour')
##D 
##D df_update <- df[, c("id", "colour")]
##D df_update$colour <- c("#FFFFFF", "#FFFFFF", "#000000")
##D 
##D google_map(key = map_key) %>%
##D   add_polygons(data = df, polyline = 'polyline', id = 'id', fill_colour = 'colour') %>%
##D   update_polygons(data = df_update, id = 'id', fill_colour = 'colour')
##D 
##D 
##D df <- aggregate(polyline ~ id + colour, data = df, list)
##D 
##D google_map(key = map_key) %>%
##D   add_polygons(data = df, polyline = 'polyline', fill_colour = 'colour')
##D 
##D google_map(key = map_key) %>%
##D   add_polygons(data = df, polyline = 'polyline', id = 'id', fill_colour = 'colour') %>%
##D   update_polygons(data = df_update, id = 'id', fill_colour = 'colour')
##D 
##D 
##D ## using coordinates
##D df <- data.frame(id = c(rep(1, 6), rep(2, 3)),
##D                  lineId = c(rep(1, 3), rep(2, 3), rep(1, 3)),
##D                  lat = c(25.774, 18.466, 32.321, 28.745, 29.570, 27.339, 21, 23, 22),
##D                  lon = c(-80.190, -66.118, -64.757, -70.579, -67.514, -66.668, -50, -49, -51))
##D 
##D google_map(key = map_key) %>%
##D   add_polygons(data = df, lat = 'lat', lon = 'lon', id = 'id', pathId = 'lineId')
##D 
##D google_map(key = map_key) %>%
##D   add_polygons(data = df, lat = 'lat', lon = 'lon', id = 'id', pathId = 'lineId') %>%
##D   update_polygons(data = df_update, id = 'id', fill_colour = 'colour')
##D 
## End(Not run)




