library(billboarder)


### Name: bb_donut
### Title: Donut property for a Billboard.js chart
### Aliases: bb_donut

### ** Examples

billboarder() %>%
  bb_donutchart(data = table(mtcars$cyl)) %>%
  bb_donut(title = "Donut Title", width = 10)
  



