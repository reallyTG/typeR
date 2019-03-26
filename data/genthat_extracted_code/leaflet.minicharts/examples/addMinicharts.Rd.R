library(leaflet.minicharts)


### Name: addMinicharts
### Title: Add or update charts on a leaflet map
### Aliases: addMinicharts updateMinicharts removeMinicharts
###   clearMinicharts

### ** Examples

require(leaflet)
mymap <- leaflet() %>% addTiles() %>% addMinicharts(0, 0, chartdata = 1:3, layerId = "c1")

mymap
mymap %>% updateMinicharts("c1", maxValues = 6)
mymap %>% updateMinicharts("c1", type="pie")




