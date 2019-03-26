library(highcharter)


### Name: hc_add_dependency_fa
### Title: Helpers functions to get FontAwesome icons code
### Aliases: hc_add_dependency_fa fa_icon fa_icon_mark

### ** Examples


dcars <- data.frame(x = runif(10), y = runif(10))
dtrck <- data.frame(x = rexp(10), y = rexp(10))

highchart() %>%
  hc_chart(zoomType = "xy") %>% 
  hc_tooltip(
    useHTML = TRUE,
    pointFormat = paste0("<span style=\"color:{series.color};\">{series.options.icon}</span>",
                         "{series.name}: <b>[{point.x}, {point.y}]</b><br/>")
                         ) %>% 
  hc_add_series(dcars, "scatter", marker = list(symbol = fa_icon_mark("car")),
                icon = fa_icon("car"), name = "car") %>% 
  hc_add_series(dtrck, "scatter", marker = list(symbol = fa_icon_mark("plane")),
                icon = fa_icon("plane"), name = "plane") %>% 
  hc_add_dependency_fa()

fa_icon("car")
fa_icon_mark("car")
fa_icon_mark(iconname = c("car", "plane", "car"))



