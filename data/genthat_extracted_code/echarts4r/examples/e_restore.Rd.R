library(echarts4r)


### Name: e_restore
### Title: Restore Toolbox
### Aliases: e_restore

### ** Examples

cars %>% 
  e_charts(speed) %>% 
  e_scatter(dist) %>% 
  e_datazoom() %>% 
  e_restore("btn") %>% 
  e_button("btn", "Reset")




