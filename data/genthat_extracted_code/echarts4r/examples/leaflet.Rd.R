library(echarts4r)


### Name: e_leaflet
### Title: Leaflet
### Aliases: e_leaflet e_leaflet_tile

### ** Examples

## Not run: 
##D url <- paste0("https://ecomfe.github.io/echarts-examples/",
##D               "public/data-gl/asset/data/population.json")
##D data <- jsonlite::fromJSON(url)
##D data <- as.data.frame(data)
##D names(data) <- c("lon", "lat", "value")
##D data$value <- log(data$value)
##D 
##D data %>% 
##D   e_charts(lon) %>% 
##D   e_leaflet() %>%
##D   e_leaflet_tile() %>%  
##D   e_scatter(lat, size = value, coord.system = "leaflet") 
## End(Not run)




