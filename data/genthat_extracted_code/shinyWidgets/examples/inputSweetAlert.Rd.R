library(shinyWidgets)


### Name: inputSweetAlert
### Title: Launch an input text dialog
### Aliases: inputSweetAlert

### ** Examples

## Not run: 
##D 
##D if (interactive()) {
##D 
##D library("shiny")
##D library("shinyWidgets")
##D 
##D 
##D ui <- fluidPage(
##D   tags$h1("Confirm sweet alert"),
##D   actionButton(inputId = "go", label = "Launch input text dialog"),
##D   verbatimTextOutput(outputId = "res")
##D )
##D server <- function(input, output, session) {
##D 
##D   observeEvent(input$go, {
##D     inputSweetAlert(
##D       session = session, inputId = "mytext",
##D       title = "What's your name ?"
##D     )
##D   })
##D 
##D   output$res <- renderPrint(input$mytext)
##D 
##D }
##D 
##D shinyApp(ui = ui, server = server)
##D 
##D }
##D 
## End(Not run)



