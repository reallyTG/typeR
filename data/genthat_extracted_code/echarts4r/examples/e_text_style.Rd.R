library(echarts4r)


### Name: e_text_style
### Title: Text style
### Aliases: e_text_style

### ** Examples

cars %>% 
  e_charts(dist) %>% 
  e_scatter(speed) %>% 
  e_labels() %>% 
  e_text_style(
    color = "blue",
    fontStyle = "italic"
  )




