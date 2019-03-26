library(googleway)


### Name: google_map-shiny
### Title: Shiny bindings for google_map
### Aliases: google_map-shiny google_mapOutput renderGoogle_map

### ** Examples

## Not run: 
##D library(shiny)
##D library(googleway)
##D 
##D ui <- fluidPage(google_mapOutput("map"))
##D 
##D server <- function(input, output, session){
##D 
##D   api_key <- "your_api_key"
##D 
##D   output$map <- renderGoogle_map({
##D     google_map(key = api_key)
##D   })
##D }
##D 
##D shinyApp(ui, server)
##D 
##D ## using split view
##D 
##D library(shinydashboard)
##D library(googleway)
##D 
##D ui <- dashboardPage(
##D 
##D   dashboardHeader(),
##D   dashboardSidebar(),
##D   dashboardBody(
##D     box(width = 6,
##D         google_mapOutput(outputId = "map")
##D     ),
##D     box(width = 6,
##D         google_mapOutput(outputId = "pano")
##D     )
##D   )
##D )
##D 
##D server <- function(input, output) {
##D   set_key("your_api_key")
##D 
##D   output$map <- renderGoogle_map({
##D     google_map(location = c(-37.817386, 144.967463),
##D                 zoom = 10,
##D                 split_view = "pano")
##D   })
##D }
##D 
##D shinyApp(ui, server)
##D 
## End(Not run)




