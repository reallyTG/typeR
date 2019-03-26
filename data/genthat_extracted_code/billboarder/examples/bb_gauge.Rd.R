library(billboarder)


### Name: bb_gauge
### Title: Gauge property for a Billboard.js chart
### Aliases: bb_gauge

### ** Examples

billboarder() %>% 
  bb_gaugechart(value = 50) %>% 
  bb_gauge(min = 0, max = 200, units = "km/h", width = 10,
           label = list(format = htmlwidgets::JS("function(value) {return value;}")))
           



