library(googleway)


### Name: add_heatmap
### Title: Add heatmap
### Aliases: add_heatmap

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
##D               option_radius = 0.001, legend = T)
##D 
##D ## specifying different colour gradient
##D option_gradient <- c('orange', 'blue', 'mediumpurple4', 'snow4', 'thistle1')
##D 
##D google_map(key = map_key, data = df) %>%
##D  add_heatmap(lat = "shape_pt_lat", lon = "shape_pt_lon", weight = "weight",
##D               option_radius = 0.001, option_gradient = option_gradient, legend = T)
##D 
##D  
## End(Not run)



