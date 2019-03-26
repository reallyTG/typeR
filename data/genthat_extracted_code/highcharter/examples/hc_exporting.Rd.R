library(highcharter)


### Name: hc_exporting
### Title: Setting exporting options for highcharts objects
### Aliases: hc_exporting

### ** Examples


require("dplyr")

data("citytemp")

highchart() %>% 
  hc_xAxis(categories = citytemp$month) %>% 
  hc_add_series(name = "Tokyo", data = citytemp$tokyo) %>% 
  hc_add_series(name = "London", data = citytemp$london) %>% 
  hc_exporting(enabled = TRUE,
               filename = "custom-file-name")




