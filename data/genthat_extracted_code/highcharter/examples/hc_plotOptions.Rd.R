library(highcharter)


### Name: hc_plotOptions
### Title: Setting plot options to highchart objects
### Aliases: hc_plotOptions

### ** Examples


data(citytemp)

hc <- highchart() %>% 
  hc_plotOptions(line = list(color = "blue",
                             marker = list(
                               fillColor = "white",
                               lineWidth = 2,
                               lineColor = NULL
                               )
  )) %>%  
  hc_add_series(name = "Tokyo", data = citytemp$tokyo) %>% 
  hc_add_series(name = "London", data = citytemp$london,
               marker = list(fillColor = "black"))


hc

# override the `blue` option with the explicit parameter
hc %>% 
  hc_add_series(name = "London",
               data = citytemp$new_york,
               color = "red")




