library(leafsync)


### Name: latticeView
### Title: View two or more (possibly synchronised) mapview or leaflet maps
### Aliases: latticeView latticeview sync

### ** Examples

if (interactive()) {
library(leaflet)
library(leafsync)

m1 = leaflet() %>%
  addTiles() %>%
  addPolygons(data = gadmCHE)

m2 = leaflet() %>%
  addProviderTiles("Esri.WorldImagery") %>%
  addCircleMarkers(data = breweries91,
                   color = "black",
                   opacity = 0.9,
                   fillColor = "white",
                   fillOpacity = 0.9)

# synced
sync(m1, m2)
sync(m1, m2, no.initial.sync = TRUE)

# not synced
latticeview(m1, m2)
latticeview(m1, m2, ncol = 1)
}




