library(leaflet)


### Name: setView
### Title: Methods to manipulate the map widget
### Aliases: setView flyTo fitBounds flyToBounds setMaxBounds clearBounds

### ** Examples

## No test: 
m <- leaflet() %>% addTiles() %>% setView(-71.0382679, 42.3489054, zoom = 18)
m  # the RStudio 'headquarter'
m %>% fitBounds(-72, 40, -70, 43)
m %>% clearBounds()  # world view
## End(No test)



