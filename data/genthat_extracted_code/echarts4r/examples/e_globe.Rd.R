library(echarts4r)


### Name: e_globe
### Title: Globe
### Aliases: e_globe

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
##D   e_globe(
##D     environment = e_stars_texture(),
##D     base.texture = e_globe_texture(),
##D     height.texture = e_globe_texture(),
##D     displacementScale = 0.04
##D   ) %>% 
##D   e_bar_3d(lat, value, "globe") %>% 
##D   e_visual_map(show = FALSE)
## End(Not run)




