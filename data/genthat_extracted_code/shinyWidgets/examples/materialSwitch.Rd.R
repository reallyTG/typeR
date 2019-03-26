library(shinyWidgets)


### Name: materialSwitch
### Title: Material Design Switch Input Control
### Aliases: materialSwitch

### ** Examples

materialSwitch(inputId = "somevalue", label = "")
## Not run: 
##D ## Only run examples in interactive R sessions
##D if (interactive()) {
##D 
##D ui <- fluidPage(
##D   materialSwitch(inputId = "somevalue", label = ""),
##D   verbatimTextOutput("value")
##D )
##D server <- function(input, output) {
##D   output$value <- renderText({ input$somevalue })
##D }
##D shinyApp(ui, server)
##D }
## End(Not run)




