library(echarts4r)


### Name: e_datazoom
### Title: Data zoom
### Aliases: e_datazoom

### ** Examples

USArrests %>% 
  e_charts(UrbanPop) %>% 
  e_line(Assault) %>% 
  e_area(Murder, y.index = 1, x.index = 1) %>% 
  e_y_axis(gridIndex = 1) %>%
  e_x_axis(gridIndex = 1) %>% 
  e_grid(height = "35%") %>% 
  e_grid(height = "35%", top = "50%") %>% 
  e_toolbox_feature("dataZoom", title = list(zoom = "zoom", back = "back")) %>% 
  e_datazoom(x.index = c(0, 1))




