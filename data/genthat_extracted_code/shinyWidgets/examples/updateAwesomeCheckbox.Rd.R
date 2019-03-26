library(shinyWidgets)


### Name: updateAwesomeCheckbox
### Title: Change the value of an awesome checkbox input on the client
### Aliases: updateAwesomeCheckbox

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
##D   awesomeCheckbox(
##D     inputId = "somevalue",
##D     label = "My label",
##D     value = FALSE
##D   ),
##D 
##D   verbatimTextOutput(outputId = "res"),
##D 
##D   actionButton(inputId = "updatevalue", label = "Toggle value"),
##D   textInput(inputId = "updatelabel", label = "Update label")
##D )
##D 
##D server <- function(input, output, session) {
##D 
##D   output$res <- renderPrint({
##D     input$somevalue
##D   })
##D 
##D   observeEvent(input$updatevalue, {
##D     updateAwesomeCheckbox(
##D       session = session, inputId = "somevalue",
##D       value = as.logical(input$updatevalue %%2)
##D     )
##D   })
##D 
##D   observeEvent(input$updatelabel, {
##D     updateAwesomeCheckbox(
##D       session = session, inputId = "somevalue",
##D       label = input$updatelabel
##D     )
##D   }, ignoreInit = TRUE)
##D 
##D }
##D 
##D shinyApp(ui = ui, server = server)
##D 
##D }
##D 
## End(Not run)



