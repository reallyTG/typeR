library(billboarder)


### Name: bb_zoom
### Title: Zoom property for a Billboard.js chart
### Aliases: bb_zoom

### ** Examples

# data
data("equilibre_mensuel")

# line chart
billboarder() %>% 
  bb_linechart(
    data = equilibre_mensuel[, c("date", "consommation", "production")], 
    type = "spline"
  ) %>% 
  bb_x_axis(tick = list(format = "%Y-%m", fit = FALSE)) %>% 
  bb_zoom(enabled = TRUE)




