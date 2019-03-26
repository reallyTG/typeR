library(echarts4r)


### Name: e_line
### Title: Line
### Aliases: e_line e_line_

### ** Examples

iris %>% 
  group_by(Species) %>% 
  e_charts(Sepal.Length) %>% 
  e_line(Sepal.Width) %>% 
  e_tooltip(trigger = "axis")




