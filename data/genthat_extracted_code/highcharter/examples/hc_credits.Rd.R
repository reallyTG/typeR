library(highcharter)


### Name: hc_credits
### Title: Setting credits options to highchart objects
### Aliases: hc_credits

### ** Examples


data("citytemp")

highchart() %>% 
  hc_xAxis(categories = citytemp$month) %>% 
  hc_add_series(name = "Tokyo", data = citytemp$tokyo, type = "bar") %>% 
  hc_credits(enabled = TRUE, text = "htmlwidgets.org",
             href = "http://www.htmlwidgets.org/")
             



