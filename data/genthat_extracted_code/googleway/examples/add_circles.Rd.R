library(googleway)


### Name: add_circles
### Title: Add circle
### Aliases: add_circles

### ** Examples

## Not run: 
##D 
##D map_key <- 'your_api_key'
##D 
##D google_map(key = map_key, data = tram_stops) %>%
##D  add_circles(lat = "stop_lat", lon = "stop_lon", fill_colour = "stop_name",
##D  stroke_weight = 0.3, stroke_colour = "stop_name", info_window ="stop_id")
##D 
##D ## different colour palettes
##D lstPalette <- list(fill_colour = colorRampPalette(c("red","blue")),
##D     stroke_colour = viridisLite::plasma)
##D 
##D ## set the key via set_key()
##D set_key(key = map_key)
##D 
##D google_map(data = tram_stops) %>%
##D  add_circles(lat = "stop_lat", lon = "stop_lon", fill_colour = "stop_lat",
##D  stroke_weight = 2, stroke_colour = "stop_name", palette = lstPalette, legend = T)
##D 
##D ## controlling the legend
##D google_map(data = tram_stops) %>%
##D  add_circles(lat = "stop_lat", lon = "stop_lon", fill_colour = "stop_lat",
##D  stroke_weight = 2, stroke_colour = "stop_name",
##D  legend = c(fill_colour = T, stroke_colour = F),
##D  legend_options = list(position = "TOP_RIGHT", css = "max-height: 100px;"))
##D 
##D google_map(data = tram_stops) %>%
##D  add_circles(lat = "stop_lat", lon = "stop_lon", fill_colour = "stop_lat",
##D  stroke_weight = 2, stroke_colour = "stop_name",
##D  legend = T,
##D  legend_options = list(
##D    fill_colour = list(position = "TOP_RIGHT", css = "max-height: 100px;"),
##D    stroke_colour = list(position = "LEFT_BOTTOM", title = "Stop Name")
##D    ))
##D 
##D 
##D  
## End(Not run)



