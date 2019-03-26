library(leaflet.extras)


### Name: weatherIconList
### Title: Make weather-icon set
### Aliases: weatherIconList [.leaflet_weather_icon_set makeWeatherIcon
###   weatherIcons addWeatherMarkers

### ** Examples


iconSet = weatherIconList(
  hurricane = makeWeatherIcon(icon = "hurricane"),
  tornado = makeWeatherIcon(icon = "tornado")
)

iconSet[c("hurricane", "tornado")]
leaflet() %>%
  addTiles() %>%
  addWeatherMarkers(
    lng = -118.456554, lat = 34.078039,
    label = "This is a label",
    icon = makeWeatherIcon(
      icon = "hot",
      iconColor = "#ffffff77",
      markerColor = "blue"
    )
  )

## for more examples see
# browseURL(system.file("examples/weatherIcons.R", package = "leaflet.extras"))



