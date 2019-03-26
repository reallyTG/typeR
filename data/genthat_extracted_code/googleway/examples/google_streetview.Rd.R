library(googleway)


### Name: google_streetview
### Title: Google street view
### Aliases: google_streetview

### ** Examples

## Not run: 
##D 
##D ## download and display an image
##D # key <- "your_api_key"
##D google_streetview(location = c(-37.817714, 144.96726),
##D     size = c(400,400), output = "plot",
##D     key = key)
##D 
##D 
##D ## no response check - display 'sorry' message
##D google_streetview(location = c(-37.8, 144),
##D    size = c(400,400),
##D    panorama_id = NULL,
##D    output = "plot",
##D    heading = 90,
##D    fov = 90,
##D    pitch = 0,
##D    response_check = FALSE,
##D    key = key)
##D 
##D 
##D ## embed an image of Flinders Street Station into a Shiny webpage
##D library(shiny)
##D library(googleway)
##D 
##D ui <- fluidPage(
##D   uiOutput(outputId = "myStreetview")
##D )
##D 
##D server <- function(input, output){
##D   key <- "your_api_key"
##D 
##D   output$myStreetview <- renderUI({
##D     tags$img(src = google_streetview(location = c(-37.817714, 144.96726),
##D                                      size = c(400,400), output = "html",
##D                                      key = key),  width = "400px", height = "400px")
##D   })
##D }
##D 
##D shinyApp(ui, server)
##D 
## End(Not run)



