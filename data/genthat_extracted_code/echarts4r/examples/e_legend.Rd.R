library(echarts4r)


### Name: e_legend
### Title: Legend
### Aliases: e_legend

### ** Examples

mtcars %>% 
  head() %>% 
  dplyr::mutate(model = row.names(.)) %>% 
  e_charts(model) %>% 
  e_pie(carb) %>% 
  e_legend(FALSE)




