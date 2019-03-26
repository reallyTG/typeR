library(billboarder)


### Name: bb_subchart
### Title: Subchart property for a Billboard.js chart
### Aliases: bb_subchart

### ** Examples


data("equilibre_mensuel")

billboarder() %>% 
  bb_linechart(data = equilibre_mensuel[, c("date", "production")], type = "spline") %>% 
  bb_subchart(show = TRUE)




