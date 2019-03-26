library(echarts4r)


### Name: e_mark_point
### Title: Mark point
### Aliases: e_mark_point e_mark_line e_mark_area

### ** Examples

max <- list(
  name = "Max",
  type = "max"
)

min <- list(
  name = "Min",
  type = "min"
)

avg <- list(
  type = "average",
  name = "AVG"
)

USArrests %>% 
  e_charts(Murder) %>% 
  e_line(Rape) %>% 
  e_line(UrbanPop) %>% 
  e_mark_point(data = max) %>% 
  e_mark_point(data = min) %>% 
  e_mark_line(serie = "Rape", data = avg) %>% 
  e_mark_area(serie = "Rape", data = list(
    list(xAxis = "min", yAxis = "min"), 
    list(xAxis = "max", yAxis = "max"))
 )




