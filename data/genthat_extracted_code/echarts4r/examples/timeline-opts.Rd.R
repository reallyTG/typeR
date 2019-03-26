library(echarts4r)


### Name: timeline-opts
### Title: Timeline
### Aliases: timeline-opts e_timeline_opts e_timeline_serie

### ** Examples

# general options
iris %>% 
  group_by(Species) %>% 
  e_charts(Sepal.Length, timeline = TRUE) %>% 
  e_line(Sepal.Width) %>% 
  e_timeline_opts(
    autoPlay = TRUE,
    rewind = TRUE
  )
  
# serie options
iris %>% 
  group_by(Species) %>% 
  e_charts(Sepal.Length, timeline = TRUE) %>% 
  e_line(Sepal.Width) %>% 
    e_timeline_serie(
      title = list(
        list(text = "setosa"),
        list(text = "versicolor"),
        list(text = "virginica")
      )
    )




