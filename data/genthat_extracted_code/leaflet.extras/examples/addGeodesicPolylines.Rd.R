library(leaflet.extras)


### Name: addGeodesicPolylines
### Title: Add Geodesic Lines
### Aliases: addGeodesicPolylines addGreatCircles

### ** Examples

berlin <- c(52.51, 13.4)
losangeles <- c(34.05, -118.24)
santiago <- c(-33.44, -70.71)
tokio <- c(35.69, 139.69)
sydney <- c(-33.91, 151.08)
capetown <- c(-33.91, 18.41)
calgary <- c(51.05, -114.08)
hammerfest <- c(70.67, 23.68)
barrow <- c(71.29, -156.76)

df <- as.data.frame(rbind(hammerfest, calgary, losangeles, santiago, capetown, tokio, barrow))
names(df) <- c("lat","lng")

leaflet(df) %>%
  addProviderTiles(providers$CartoDB.Positron) %>%
  addGeodesicPolylines(lng = ~lng, lat = ~lat, weight = 2, color = "red",
                       steps = 50, opacity = 1) %>%
  addCircleMarkers(df, lat = ~lat,lng = ~lng, radius = 3, stroke = FALSE,
                   fillColor = "black", fillOpacity = 1)

## for more examples see
# browseURL(system.file("examples/geodesic.R", package = "leaflet.extras"))



