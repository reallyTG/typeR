library(echarts4r)


### Name: e_pie
### Title: Pie
### Aliases: e_pie e_pie_

### ** Examples

mtcars %>% 
  head() %>% 
  dplyr::mutate(model = row.names(.)) %>% 
  e_charts(model) %>% 
  e_pie(carb)
  



