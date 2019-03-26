library(echarts4r)


### Name: e_radius_axis
### Title: Radius axis
### Aliases: e_radius_axis

### ** Examples

df <- data.frame(x = 1:10, y = seq(1, 20, by = 2))

df %>% 
  e_charts(x) %>% 
  e_polar() %>% 
  e_angle_axis() %>% 
  e_radius_axis(FALSE) %>% 
  e_line(y, coord.system = "polar", smooth = TRUE) 




