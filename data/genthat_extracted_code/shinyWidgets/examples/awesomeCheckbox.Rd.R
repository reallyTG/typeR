library(shinyWidgets)


### Name: awesomeCheckbox
### Title: Awesome Checkbox Input Control
### Aliases: awesomeCheckbox

### ** Examples

## Not run: 
##D ## Only run examples in interactive R sessions
##D if (interactive()) {
##D 
##D ui <- fluidPage(
##D  awesomeCheckbox(inputId = "somevalue",
##D                  label = "A single checkbox",
##D                  value = TRUE,
##D                  status = "danger"),
##D  verbatimTextOutput("value")
##D )
##D server <- function(input, output) {
##D   output$value <- renderText({ input$somevalue })
##D }
##D shinyApp(ui, server)
##D }
## End(Not run)




