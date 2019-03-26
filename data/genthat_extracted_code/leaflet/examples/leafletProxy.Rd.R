library(leaflet)


### Name: leafletProxy
### Title: Send commands to a Leaflet instance in a Shiny app
### Aliases: leafletProxy

### ** Examples

library(shiny)

ui <- fluidPage(
  leafletOutput("map1")
)

map <- leaflet() %>% addCircleMarkers(
  lng = runif(10),
  lat = runif(10),
  layerId = paste0("marker", 1:10))
server <- function(input, output, session) {
  output$map1 <- renderLeaflet(map)

  observeEvent(input$map1_marker_click, {
    leafletProxy("map1", session) %>%
      removeMarker(input$map1_marker_click$id)
  })
}

app <- shinyApp(ui, server)
## No test: 
if (interactive()) app
## End(No test)




