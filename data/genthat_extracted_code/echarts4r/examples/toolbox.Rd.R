library(echarts4r)


### Name: e_toolbox_feature
### Title: Toolbox
### Aliases: e_toolbox_feature e_toolbox

### ** Examples

USArrests %>% 
  e_charts(UrbanPop) %>% 
  e_line(Assault) %>% 
  e_area(Murder, y.index = 1, x.index = 1) %>% 
  e_datazoom(x.index = 0) 




