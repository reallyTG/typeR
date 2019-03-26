library(googleway)


### Name: update_heatmap
### Title: update heatmap
### Aliases: update_heatmap

### ** Examples

## Not run: 
##D 
##D map_key <- 'your_api_key'
##D 
##D set.seed(20170417)
##D df <- tram_route
##D df$weight <- sample(1:10, size = nrow(df), replace = T)
##D 
##D google_map(key = map_key, data = df) %>%
##D  add_heatmap(lat = "shape_pt_lat", lon = "shape_pt_lon", weight = "weight",
##D               option_radius = 0.001)
##D 
##D ## update by adding the same data again to double the number of points at each location
##D df_update <- df
##D google_map(key = map_key, data = df) %>%
##D  add_heatmap(lat = "shape_pt_lat", lon = "shape_pt_lon", weight = "weight",
##D               option_radius = 0.001) %>%
##D  update_heatmap(df_update, lat = "shape_pt_lat", lon = "shape_pt_lon")
##D 
## End(Not run)




