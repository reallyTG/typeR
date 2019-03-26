library(leaflet)


### Name: easyButtonState
### Title: Create an easyButton statestate
### Aliases: easyButtonState easyButton addEasyButton addEasyButtonBar

### ** Examples

leaf <- leaflet() %>%
  addTiles() %>%
  addEasyButton(easyButton(
     icon = htmltools::span(class = "star", htmltools::HTML("&starf;")),
     onClick = JS("function(btn, map){ map.setZoom(1);}")))
leaf

leaf <- leaflet() %>%
  addTiles() %>%
  addEasyButtonBar(
   easyButton(
     icon = htmltools::span(class = "star", htmltools::HTML("&starf;")),
     onClick = JS("function(btn, map){ alert(\"Button 1\");}")),
   easyButton(
     icon = htmltools::span(class = "star", htmltools::HTML("&target;")),
     onClick = JS("function(btn, map){ alert(\"Button 2\");}")))
leaf





