library(echarts4r)


### Name: angle_axis
### Title: Angle axis
### Aliases: angle_axis e_angle_axis e_angle_axis_

### ** Examples

df <- data.frame(x = 1:100, y = seq(1, 200, by = 2))

df %>% 
  e_charts(x) %>% 
  e_polar(FALSE) %>% 
  e_angle_axis(FALSE) %>% 
  e_radius_axis(FALSE) %>% 
  e_line(y, coord.system = "polar", smooth = TRUE) %>% 
  e_legend(show = FALSE)
  
df <- data.frame(x = LETTERS[1:5], y = runif(5))

df %>% 
  e_charts(x) %>% 
  e_polar() %>% 
  e_angle_axis(x) %>% 
  e_radius_axis() %>% 
  e_line(y, coord.system = "polar", smooth = TRUE)




