library(highcharter)


### Name: hc_legend
### Title: Setting legend options to highchart objects
### Aliases: hc_legend

### ** Examples


data(citytemp)

highchart() %>% 
  hc_xAxis(categories = citytemp$month) %>% 
  hc_add_series(name = "Tokyo", data = citytemp$tokyo) %>% 
  hc_add_series(name = "London", data = citytemp$london) %>%
  hc_legend(align = "left", verticalAlign = "top",
            layout = "vertical", x = 0, y = 100) 
            



