library(shinyWidgets)


### Name: radioGroupButtons
### Title: Buttons Group Radio Input Control
### Aliases: radioGroupButtons

### ** Examples

## Not run: 
##D ## Only run examples in interactive R sessions
##D if (interactive()) {
##D 
##D ui <- fluidPage(
##D   radioGroupButtons(inputId = "somevalue", choices = c("A", "B", "C")),
##D   verbatimTextOutput("value")
##D )
##D server <- function(input, output) {
##D   output$value <- renderText({ input$somevalue })
##D }
##D shinyApp(ui, server)
##D }
## End(Not run)




