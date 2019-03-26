library(echarts4r)


### Name: e_polar
### Title: Polar
### Aliases: e_polar

### ** Examples

df <- data.frame(x = 1:10, y = seq(1, 20, by = 2))

df %>% 
  e_charts(x) %>% 
  e_polar() %>% 
  e_angle_axis() %>% 
  e_radius_axis() %>% 
  e_line(y, coord.system = "polar", smooth = TRUE) 




