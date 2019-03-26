library(highcharter)


### Name: hc_add_series
### Title: Adding and removing series from highchart objects
### Aliases: hc_add_series

### ** Examples


 highchart() %>%
   hc_add_series(data = abs(rnorm(5)), type = "columnn") %>% 
   hc_add_series(data = purrr::map(0:4, function(x) list(x, x)), type = "scatter", color = "blue")




