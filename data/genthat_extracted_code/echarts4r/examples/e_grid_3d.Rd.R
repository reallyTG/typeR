library(echarts4r)


### Name: e_grid_3d
### Title: Grid
### Aliases: e_grid_3d

### ** Examples

USArrests %>% 
  e_charts(UrbanPop) %>% 
  e_line(Assault, smooth = TRUE) %>% 
  e_area(Murder, y.index = 1, x.index = 1) %>% 
  e_y_axis(gridIndex = 1) %>%
  e_x_axis(gridIndex = 1) %>% 
  e_grid(height = "40%") %>% 
  e_grid(height = "40%", top = "55%")




