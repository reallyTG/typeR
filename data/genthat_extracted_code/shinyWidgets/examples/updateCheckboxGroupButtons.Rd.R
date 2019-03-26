library(shinyWidgets)


### Name: updateCheckboxGroupButtons
### Title: Change the value of a checkboxes group buttons input on the
###   client
### Aliases: updateCheckboxGroupButtons

### ** Examples

## Not run: 
##D if (interactive()) {
##D 
##D library(shiny)
##D library(shinyWidgets)
##D 
##D # Example 1 ----
##D 
##D ui <- fluidPage(
##D 
##D   radioButtons(inputId = "up", label = "Update button :", choices = c("All", "None")),
##D 
##D   checkboxGroupButtons(
##D     inputId = "btn", label = "Power :",
##D     choices = c("Nuclear", "Hydro", "Solar", "Wind"),
##D     selected = "Hydro"
##D   ),
##D 
##D   verbatimTextOutput(outputId = "res")
##D 
##D )
##D 
##D server <- function(input,output, session){
##D 
##D   observeEvent(input$up, {
##D     if (input$up == "All"){
##D       updateCheckboxGroupButtons(session, "btn", selected = c("Nuclear", "Hydro", "Solar", "Wind"))
##D     } else {
##D       updateCheckboxGroupButtons(session, "btn", selected = character(0))
##D     }
##D   }, ignoreInit = TRUE)
##D 
##D   output$res <- renderPrint({
##D     input$btn
##D   })
##D }
##D 
##D shinyApp(ui = ui, server = server)
##D 
##D 
##D # Example 2 ----
##D 
##D library("shiny")
##D library("shinyWidgets")
##D 
##D ui <- fluidPage(
##D   checkboxGroupButtons(
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
##D     choices = c("A", "B", "C"), multiple = TRUE
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
##D     updateCheckboxGroupButtons(
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
##D     updateCheckboxGroupButtons(
##D       session = session, inputId = "somevalue",
##D       selected = input$updateselected
##D     )
##D   }, ignoreNULL = TRUE, ignoreInit = TRUE)
##D 
##D   observeEvent(input$updatelabel, {
##D     updateCheckboxGroupButtons(
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
## End(Not run)



