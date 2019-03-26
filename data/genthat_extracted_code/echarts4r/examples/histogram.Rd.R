library(echarts4r)


### Name: e_histogram
### Title: Histogram & Density
### Aliases: e_histogram e_density e_histogram_ e_density_

### ** Examples

mtcars %>% 
  e_charts() %>% 
  e_histogram(mpg, name = "histogram") %>% 
  e_density(mpg, areaStyle = list(opacity = .4), smooth = TRUE, name = "density", y.index = 1) %>% 
  e_tooltip(trigger = "axis")




