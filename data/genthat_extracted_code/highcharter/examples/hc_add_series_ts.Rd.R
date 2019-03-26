library(highcharter)


### Name: hc_add_series_ts
### Title: Shortcut for create/add time series charts from a ts object
### Aliases: hc_add_series_ts

### ** Examples


## Not run: 
##D highchart() %>% 
##D   hc_title(text = "Monthly Airline Passenger Numbers 1949-1960") %>% 
##D   hc_subtitle(text = "The classic Box and Jenkins airline data") %>% 
##D   hc_add_series_ts(AirPassengers, name = "passengers") %>%
##D   hc_tooltip(pointFormat =  '{point.y} passengers')
##D 
##D highchart() %>% 
##D   hc_title(text = "Monthly Deaths from Lung Diseases in the UK") %>% 
##D   hc_add_series_ts(fdeaths, name = "Female") %>%
##D   hc_add_series_ts(mdeaths, name = "Male")
## End(Not run)




