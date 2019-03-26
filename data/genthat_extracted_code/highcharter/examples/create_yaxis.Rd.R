library(highcharter)


### Name: create_yaxis
### Title: Creating multiples yAxis t use with highcharts
### Aliases: create_yaxis

### ** Examples


highchart() %>% 
   hc_yAxis_multiples(create_yaxis(naxis = 2, heights = c(2, 1))) %>% 
   hc_add_series(data = c(1,3,2), yAxis = 0) %>% 
   hc_add_series(data = c(20, 40, 10), yAxis = 1)
   
highchart() %>% 
  hc_yAxis_multiples(create_yaxis(naxis = 3, lineWidth = 2, title = list(text = NULL))) %>% 
  hc_add_series(data = c(1,3,2)) %>% 
  hc_add_series(data = c(20, 40, 10), yAxis = 1) %>% 
  hc_add_series(data = c(200, 400, 500), type = "columnn", yAxis = 2) %>% 
  hc_add_series(data = c(500, 300, 400), type = "columnn", yAxis = 2)  
   



