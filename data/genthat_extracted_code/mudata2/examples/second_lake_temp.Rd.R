library(mudata2)


### Name: second_lake_temp
### Title: Second Lake Thermistor String Data
### Aliases: second_lake_temp
### Keywords: datasets

### ** Examples

library(ggplot2)
autoplot(second_lake_temp, y = "depth", x = "datetime", 
         col = "value", geom = "point") + 
  scale_y_reverse()
autoplot(second_lake_temp, x = "datetime", y = "value", 
         facets = c("param", "depth"))




