library(echarts4r)


### Name: e_angle_axis
### Title: Angle axis
### Aliases: e_angle_axis

### ** Examples

df <- data.frame(x = 1:100, y = seq(1, 200, by = 2))

df %>% 
  e_charts(x) %>% 
  e_polar(FALSE) %>% 
  e_angle_axis(FALSE) %>% 
  e_radius_axis(FALSE) %>% 
  e_line(y, coord.system = "polar", smooth = TRUE) %>% 
  e_legend(show = FALSE)




