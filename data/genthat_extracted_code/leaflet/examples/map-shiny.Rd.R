library(leaflet)


### Name: leafletOutput
### Title: Wrapper functions for using 'leaflet' in 'shiny'
### Aliases: leafletOutput renderLeaflet

### ** Examples

# !formatR
library(shiny)
app <- shinyApp(
  ui = fluidPage(leafletOutput('myMap')),
  server = function(input, output) {
    map = leaflet() %>% addTiles() %>% setView(-93.65, 42.0285, zoom = 17)
    output$myMap = renderLeaflet(map)
  }
)

## No test: 
if (interactive()) app
## End(No test)



