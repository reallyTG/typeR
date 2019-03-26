library(echarts4r)


### Name: pie_action
### Title: Select & Unselect Pie
### Aliases: pie_action e_pie_select e_pie_unselect

### ** Examples

mtcars %>% 
  head() %>% 
  dplyr::mutate(model = row.names(.)) %>% 
  e_charts(model) %>% 
  e_pie(carb) %>% 
  e_pie_select(dataIndex = 0)




