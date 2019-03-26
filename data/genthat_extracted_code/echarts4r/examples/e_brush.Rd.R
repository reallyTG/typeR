library(echarts4r)


### Name: e_brush
### Title: Brush
### Aliases: e_brush

### ** Examples

quakes %>% 
  e_charts(long) %>% 
  e_geo(
    boundingCoords = list(
      c(190, -10),
      c(180, -40)
     )
  ) %>% 
  e_scatter(lat, mag, stations, coord.system = "geo", scale = "* 1.5", name = "mag") %>% 
  e_data(quakes, depth) %>% 
  e_scatter(mag, mag, stations, scale = "* 3", name = "mag & depth") %>%  
  e_grid(right = 40, top = 100, width = "30%") %>% 
  e_y_axis(type = "value", name = "depth", min = 3.5) %>% 
  e_brush() %>% 
  e_theme("dark")




