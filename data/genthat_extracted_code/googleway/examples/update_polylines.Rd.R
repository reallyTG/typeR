library(googleway)


### Name: update_polylines
### Title: Update polylines
### Aliases: update_polylines

### ** Examples

## Not run: 
##D 
##D map_key <- 'your_api_key'
##D 
##D ## coordinate columns
##D ## plot polylines using default attributes
##D df <- tram_route
##D df$id <- c(rep(1, 27), rep(2, 28))
##D 
##D df$colour <- c(rep("#00FFFF", 27), rep("#FF00FF", 28))
##D 
##D google_map(key = map_key) %>%
##D   add_polylines(data = df, lat = 'shape_pt_lat', lon = 'shape_pt_lon',
##D                 stroke_colour = "colour", id = 'id')
##D 
##D ## specify width and colour attributes to update
##D df_update <- data.frame(id = c(1,2),
##D                         width = c(3,10),
##D                         colour = c("#00FF00", "#DCAB00"))
##D 
##D google_map(key = map_key) %>%
##D   add_polylines(data = df, lat = 'shape_pt_lat', lon = 'shape_pt_lon',
##D                 stroke_colour = "colour", id = 'id') %>%
##D   update_polylines(data = df_update, id = 'id', stroke_weight = "width",
##D                    stroke_colour = 'colour')
##D 
##D 
##D ## encoded polylines
##D pl <- sapply(unique(df$id), function(x){
##D   encode_pl(lat = df[ df$id == x , 'shape_pt_lat'], lon = df[ df$id == x, 'shape_pt_lon'])
##D })
##D 
##D df <- data.frame(id = c(1, 2), polyline = pl)
##D 
##D df_update <- data.frame(id = c(1,2),
##D                         width = c(3,10),
##D                         var = c("a","b"))
##D 
##D google_map(key = map_key) %>%
##D   add_polylines(data = df, polyline = 'polyline')
##D 
##D google_map(key = map_key) %>%
##D   add_polylines(data = df, polyline = 'polyline') %>%
##D   update_polylines(data = df_update, id = 'id', stroke_weight = "width",
##D                    stroke_colour = 'var')
##D 
## End(Not run)




