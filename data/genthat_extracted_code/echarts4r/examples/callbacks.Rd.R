library(echarts4r)


### Name: callbacks
### Title: Callbacks
### Aliases: callbacks e_on e_off

### ** Examples

cars %>% 
  e_charts(speed) %>% 
  e_scatter(dist) %>% 
  e_on(
    list(seriesName = "dist"),
    "function(){alert('Serie clicked')}"
  )




