library(shinyWidgets)


### Name: checkboxGroupButtons
### Title: Buttons Group checkbox Input Control
### Aliases: checkboxGroupButtons

### ** Examples

## Not run: 
##D ## Only run examples in interactive R sessions
##D if (interactive()) {
##D 
##D ui <- fluidPage(
##D   checkboxGroupButtons(inputId = "somevalue",
##D                        label = "Make a choice: ",
##D                        choices = c("A", "B", "C")),
##D   verbatimTextOutput("value")
##D )
##D server <- function(input, output) {
##D   output$value <- renderText({ input$somevalue })
##D }
##D shinyApp(ui, server)
##D }
## End(Not run)




