library(echarts4r)


### Name: e_bar_3d
### Title: Bar 3D
### Aliases: e_bar_3d e_bar_3d_

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
##D     base.texture = e_globe_texture()
##D   ) %>% 
##D   e_bar_3d(lat, value, coord.system = "globe") %>% 
##D   e_visual_map()
##D   
##D data %>% 
##D   e_charts(lon) %>% 
##D   e_geo_3d() %>% 
##D   e_bar_3d(lat, value, coord.system = "geo3D") %>% 
##D   e_visual_map()
##D   
##D v <- LETTERS[1:10]
##D matrix <- data.frame(
##D   x = sample(v, 300, replace = TRUE), 
##D   y = sample(v, 300, replace = TRUE), 
##D   z1 = rnorm(300, 10, 1),
##D   z2 = rnorm(300, 10, 1),
##D   stringsAsFactors = FALSE
##D ) %>% 
##D   dplyr::group_by(x, y) %>% 
##D   dplyr::summarise(
##D     z1 = sum(z1),
##D     z2 = sum(z2)
##D   ) %>% 
##D   dplyr::ungroup() 
##D   
##D trans <- list(opacity = 0.4) # transparency
##D emphasis <- list(itemStyle = list(color = "#313695"))
##D   
##D matrix %>% 
##D   e_charts(x) %>% 
##D   e_bar_3d(y, z1, stack = "stack", name = "Serie 1", itemStyle = trans, emphasis = emphasis) %>%
##D   e_bar_3d(y, z2, stack = "stack", name = "Serie 2", itemStyle = trans, emphasis = emphasis) %>% 
##D   e_legend()
## End(Not run)




