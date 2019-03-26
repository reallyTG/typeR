library(echarts4r)


### Name: highlight_action
### Title: Highlight & Downplay
### Aliases: highlight_action e_highlight e_downplay

### ** Examples

iris %>% 
  group_by(Species) %>% 
  e_charts(Sepal.Length) %>% 
  e_line(Sepal.Width) %>% 
  e_line(Petal.Length) %>% 
  e_highlight(series_name = "setosa") # highlight group




