library(echarts4r)


### Name: e_bar
### Title: Bar and Line chart
### Aliases: e_bar e_bar_

### ** Examples

iris %>% 
  group_by(Species) %>% 
  e_charts(Sepal.Length) %>% 
  e_line(Sepal.Width)




