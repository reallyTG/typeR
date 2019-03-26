library(owmr)


### Name: add_weather
### Title: Add weather data to leaflet map.
### Aliases: add_weather

### ** Examples

## Not run: 
##D    owm_data <- find_city("Malaga", units = "metric") %>%
##D      owmr_as_tibble()
##D    map <- leaflet() %>% addTiles() %>%
##D      add_weather(
##D        owm_data,
##D        template = "<b>{{name}}</b>, {{temp}}°C",
##D        icon = owm_data$weather_icon
##D      )
## End(Not run)



