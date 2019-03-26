library(highcharter)


### Name: hc_chart
### Title: Setting chart options to highchart objects
### Aliases: hc_chart

### ** Examples


data(citytemp)

hc <- highchart() %>% 
  hc_xAxis(categories = citytemp$month) %>% 
  hc_add_series(name = "Tokyo", data = citytemp$tokyo) %>% 
  hc_add_series(name = "London", data = citytemp$london)

hc %>% 
  hc_chart(type = "columnn",
           options3d = list(enabled = TRUE, beta = 15, alpha = 15))


hc %>% 
  hc_chart(borderColor = '#EBBA95',
           borderRadius = 10,
           borderWidth = 2,
           backgroundColor = list(
             linearGradient = c(0, 0, 500, 500),
             stops = list(
               list(0, 'rgb(255, 255, 255)'),
               list(1, 'rgb(200, 200, 255)')
             )))




