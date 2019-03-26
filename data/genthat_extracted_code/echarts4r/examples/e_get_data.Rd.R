library(echarts4r)


### Name: e_get_data
### Title: Get data
### Aliases: e_get_data

### ** Examples

echart <- cars %>% 
  e_charts(speed) %>% 
  e_scatter(dist) %>% 
  e_lm(dist ~ speed) 
  
echart

e_get_data(echart)[[1]]




