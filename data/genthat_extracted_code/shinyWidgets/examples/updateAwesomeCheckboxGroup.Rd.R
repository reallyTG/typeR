library(shinyWidgets)


### Name: updateAwesomeCheckboxGroup
### Title: Change the value of a AwesomeCheckboxGroup input on the client
### Aliases: updateAwesomeCheckboxGroup

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
##D   awesomeCheckboxGroup(
##D     inputId = "somevalue",
##D     choices = c("A", "B", "C"),
##D     label = "My label"
##D   ),
##D 
##D   verbatimTextOutput(outputId = "res"),
##D 
##D   actionButton(inputId = "updatechoices", label = "Random choices"),
##D   textInput(inputId = "updatelabel", label = "Update label")
##D )
##D 
##D server <- function(input, output, session) {
##D 
##D   output$res <- renderPrint({
##D     input$somevalue
##D   })
##D 
##D   observeEvent(input$updatechoices, {
##D     updateAwesomeCheckboxGroup(
##D       session = session, inputId = "somevalue",
##D       choices = sample(letters, sample(2:6))
##D     )
##D   })
##D 
##D   observeEvent(input$updatelabel, {
##D     updateAwesomeCheckboxGroup(
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



