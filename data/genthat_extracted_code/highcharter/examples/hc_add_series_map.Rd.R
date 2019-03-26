library(highcharter)


### Name: hc_add_series_map
### Title: Add a map series
### Aliases: hc_add_series_map

### ** Examples


library("dplyr")

data("USArrests", package = "datasets")
data("usgeojson")

USArrests <- mutate(USArrests, state = rownames(USArrests))

highchart() %>% 
  hc_title(text = "Violent Crime Rates by US State") %>% 
  hc_subtitle(text = "Source: USArrests data") %>% 
  hc_add_series_map(usgeojson, USArrests, name = "Murder arrests (per 100,000)",
                    value = "Murder", joinBy = c("woename", "state"),
                    dataLabels = list(enabled = TRUE,
                                      format = '{point.properties.postalcode}')) %>% 
  hc_colorAxis(stops = color_stops()) %>% 
  hc_legend(valueDecimals = 0, valueSuffix = "%") %>%
  hc_mapNavigation(enabled = TRUE) 

## Not run: 
##D 
##D data(worldgeojson, package = "highcharter")
##D data("GNI2014", package = "treemap")
##D 
##D highchart(type = "map") %>% 
##D   hc_add_series_map(map = worldgeojson, df = GNI2014, value = "GNI", joinBy = "iso3") %>% 
##D   hc_colorAxis(stops = color_stops()) %>% 
##D   hc_tooltip(useHTML = TRUE, headerFormat = "",
##D   pointFormat = "this is {point.name} and have {point.population} people with gni of {point.GNI}")
##D   
##D  
## End(Not run)
  



