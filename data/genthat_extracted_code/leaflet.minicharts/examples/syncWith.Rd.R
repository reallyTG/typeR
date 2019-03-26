library(leaflet.minicharts)


### Name: syncWith
### Title: Synchronize multiple maps
### Aliases: syncWith

### ** Examples

if (require(manipulateWidget) & require(leaflet)) {

  # Synchronize zoom and center of basic maps.
  basicMap1 <- leaflet() %>% addTiles() %>% syncWith("basicmaps")
  basicMap2 <- leaflet() %>% addTiles() %>% syncWith("basicmaps")
  combineWidgets(basicMap1, basicMap2)

  # Synchronize time step of two maps that represent the evolution of some
  # variable.
  map1 <- leaflet() %>% addTiles() %>%
    addMinicharts(0, 40, chartdata = 1:10, time = 1:10) %>%
    syncWith("maps")
  map2 <- leaflet() %>% addTiles() %>%
    addMinicharts(0, 40, chartdata = 10:1, time = 1:10) %>%
    syncWith("maps")
  combineWidgets(map1, map2)

}




