library(echarts4r)


### Name: e_button
### Title: Button
### Aliases: e_button

### ** Examples

iris %>% 
  group_by(Species) %>% 
  e_charts(Sepal.Length) %>% 
  e_line(Sepal.Width) %>% 
  e_line(Petal.Length) %>% 
  e_highlight(series_name = "setosa", btn = "myBtn") %>% 
  e_button("myBtn", "highlight stuff")




