library(billboarder)


### Name: bb_pie
### Title: Pie property for a Billboard.js chart
### Aliases: bb_pie

### ** Examples

billboarder() %>%
  bb_piechart(data = table(mtcars$cyl)) %>% 
  bb_pie(label = list(
    ratio = 0.5, 
    format = htmlwidgets::JS("function(value) {return d3.format('$')(value);}")
  ), 
  expand = FALSE)
  



