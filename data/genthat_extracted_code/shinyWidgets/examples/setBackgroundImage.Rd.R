library(shinyWidgets)


### Name: setBackgroundImage
### Title: Custom background image for your shinyapp
### Aliases: setBackgroundImage

### ** Examples

## Not run: 
##D 
##D if (interactive()) {
##D 
##D library(shiny)
##D library(shinyWidgets)
##D 
##D ui <- fluidPage(
##D   tags$h2("Add a shiny app background image"),
##D   setBackgroundImage(src = "http://wallpics4k.com/wp-content/uploads/2014/07/470318.jpg")
##D )
##D 
##D server <- function(input, output, session) {
##D 
##D }
##D 
##D shinyApp(ui, server)
##D 
##D }
##D 
## End(Not run)



