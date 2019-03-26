library(echarts4r)


### Name: radius_axis
### Title: Radius axis
### Aliases: radius_axis e_radius_axis e_radius_axis_

### ** Examples

df <- data.frame(x = LETTERS[1:10], y = seq(1, 20, by = 2))

df %>% 
  e_charts(x) %>% 
  e_polar() %>% 
  e_angle_axis() %>% 
  e_radius_axis(x) %>% 
  e_bar(y, coord.system = "polar") 




