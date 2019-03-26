library(echarts4r)


### Name: e_axis
### Title: Axis
### Aliases: e_axis e_x_axis e_y_axis e_z_axis

### ** Examples

USArrests %>% 
  e_charts(Assault) %>% 
  e_line(Murder, smooth = TRUE) %>% 
  e_line(Rape, y.index = 1) %>% # add secondary axis
  e_y_axis(index = 1, show = FALSE) # hide secondary axis

# plot all labels & rotate
USArrests %>% 
  head(10) %>% 
  dplyr::mutate(State = row.names(.)) %>% 
  e_charts(State) %>% 
  e_area(Murder) %>% 
  e_x_axis(axisLabel = list(interval = 0, rotate = 45)) # rotate
  



