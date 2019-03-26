library(highcharter)


### Name: hc_colors
### Title: Setting color options to highchart objects
### Aliases: hc_colors

### ** Examples


library("viridisLite")

cols <- viridis(3)
cols <- substr(cols, 0, 7)

highcharts_demo() %>% 
  hc_colors(cols)





