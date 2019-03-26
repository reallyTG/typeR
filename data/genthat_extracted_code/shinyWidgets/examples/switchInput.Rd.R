library(shinyWidgets)


### Name: switchInput
### Title: Bootstrap Switch Input Control
### Aliases: switchInput

### ** Examples

## Not run: 
##D ## Only run examples in interactive R sessions
##D if (interactive()) {
##D 
##D # Examples in the gallery :
##D shinyWidgets::shinyWidgetsGallery()
##D 
##D # Basic usage :
##D ui <- fluidPage(
##D   switchInput(inputId = "somevalue"),
##D   verbatimTextOutput("value")
##D )
##D server <- function(input, output) {
##D   output$value <- renderPrint({ input$somevalue })
##D }
##D shinyApp(ui, server)
##D }
## End(Not run)



