library(inlmisc)


### Name: AddWebMapElements
### Title: Add Elements to Web Map
### Aliases: AddWebMapElements AddHomeButton AddClusterButton
###   AddSearchButton AddLegend
### Keywords: hplot

### ** Examples

city <- rgdal::readOGR(system.file("extdata/city.geojson", package = "inlmisc")[1])
opt <- leaflet::markerClusterOptions(showCoverageOnHover = FALSE)
map <- CreateWebMap("Topo")
map <- leaflet::addMarkers(map, label = ~name, popup = ~name, clusterOptions = opt,
                           clusterId = "cluster", group = "marker", data = city)
map <- AddHomeButton(map)
map <- AddClusterButton(map, clusterId = "cluster")
map <- AddSearchButton(map, group = "marker", zoom = 15,
                       textPlaceholder = "Search city names...")
map

labels <- c("Non-capital", "Capital")
colors <- c("green", "red")
fillColor <- colors[(city@data$capital > 0) + 1]
map <- CreateWebMap("Topo")
map <- leaflet::addCircleMarkers(map, radius = 6, color = "white", weight = 1,
                                 opacity = 1, fillColor = fillColor, fillOpacity = 1,
                                 fill = TRUE, data = city)
map <- AddLegend(map, labels = labels, colors = colors, radius = 5,
                 opacity = 1, symbol = "circle")
map




