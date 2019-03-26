library(echarts4r)


### Name: mapbox
### Title: Mapbox
### Aliases: mapbox e_mapbox

### ** Examples

## Not run: 
##D url <- paste0("https://ecomfe.github.io/echarts-examples/",
##D               "public/data-gl/asset/data/population.json")
##D data <- jsonlite::fromJSON(url)
##D data <- as.data.frame(data)
##D names(data) <- c("lon", "lat", "value")
##D 
##D data %>% 
##D   e_charts(lon) %>% 
##D   e_mapbox(
##D     token = "YOUR_MAPBOX_TOKEN",
##D     style = "mapbox://styles/mapbox/dark-v9"
##D   ) %>% 
##D   e_bar_3d(lat, value, coord_system = "mapbox") %>% 
##D   e_visual_map()
## End(Not run)




