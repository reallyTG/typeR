library(googleway)


### Name: google_map_update
### Title: Google map update
### Aliases: google_map_update

### ** Examples

## Not run: 
##D 
##D library(shiny)
##D library(googleway)
##D 
##D ui <- pageWithSidebar(
##D   headerPanel("Toggle markers"),
##D   sidebarPanel(
##D     actionButton(inputId = "markers", label = "toggle markers")
##D   ),
##D   mainPanel(
##D     google_mapOutput("map")
##D   )
##D )
##D 
##D server <- function(input, output, session){
##D 
##D   # api_key <- "your_api_key"
##D 
##D   df <- structure(list(lat = c(-37.8201904296875, -37.8197288513184,
##D   -37.8191299438477, -37.8187675476074, -37.8186187744141, -37.8181076049805
##D   ), lon = c(144.968612670898, 144.968414306641, 144.968139648438,
##D  144.967971801758, 144.967864990234, 144.967636108398), weight = c(31.5698964400217,
##D  97.1629025738221, 58.9051092562731, 76.3215389118996, 37.8982300488278,
##D  77.1501972114202), opacity = c(0.2, 0.2, 0.2, 0.2, 0.2, 0.2)), .Names = c("lat",
##D  "lon", "weight", "opacity"), row.names = 379:384, class = "data.frame")
##D 
##D 
##D   output$map <- renderGoogle_map({
##D     google_map(key = api_key)
##D   })
##D 
##D   observeEvent(input$markers,{
##D 
##D     if(input$markers %% 2 == 1){
##D       google_map_update(map_id = "map") %>%
##D         add_markers(data = df)
##D     }else{
##D       google_map_update(map_id = "map") %>%
##D         clear_markers()
##D     }
##D   })
##D  }
##D shinyApp(ui, server)
## End(Not run)



