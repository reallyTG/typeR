library(shinyWidgets)


### Name: updateRadioGroupButtons
### Title: Change the value of a radio group buttons input on the client
### Aliases: updateRadioGroupButtons

### ** Examples

## Not run: 
##D 
##D if (interactive()) {
##D 
##D library("shiny")
##D library("shinyWidgets")
##D 
##D ui <- fluidPage(
##D   radioGroupButtons(
##D     inputId = "somevalue",
##D     choices = c("A", "B", "C"),
##D     label = "My label"
##D   ),
##D 
##D   verbatimTextOutput(outputId = "res"),
##D 
##D   actionButton(inputId = "updatechoices", label = "Random choices"),
##D   pickerInput(
##D     inputId = "updateselected", label = "Update selected:",
##D     choices = c("A", "B", "C"), multiple = FALSE
##D   ),
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
##D     newchoices <- sample(letters, sample(2:6))
##D     updateRadioGroupButtons(
##D       session = session, inputId = "somevalue",
##D       choices = newchoices
##D     )
##D     updatePickerInput(
##D       session = session, inputId = "updateselected",
##D       choices = newchoices
##D     )
##D   })
##D 
##D   observeEvent(input$updateselected, {
##D     updateRadioGroupButtons(
##D       session = session, inputId = "somevalue",
##D       selected = input$updateselected
##D     )
##D   }, ignoreNULL = TRUE, ignoreInit = TRUE)
##D 
##D   observeEvent(input$updatelabel, {
##D     updateRadioGroupButtons(
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



