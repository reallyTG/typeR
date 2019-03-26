library(highcharter)


### Name: hc_add_series_list
### Title: Shortcut for data series from a list of data series
### Aliases: hc_add_series_list

### ** Examples


ds <- lapply(seq(5), function(x){
  list(data = cumsum(rnorm(100, 2, 5)), name = x)
})

highchart() %>% 
  hc_plotOptions(series = list(marker = list(enabled = FALSE))) %>% 
  hc_add_series_list(ds)
  



