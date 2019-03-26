library(shinyWidgets)


### Name: updateMultiInput
### Title: Change the value of a multi input on the client
### Aliases: updateMultiInput

### ** Examples

## Not run: 
##D 
##D if (interactive()) {
##D 
##D library(shiny)
##D library(shinyWidgets)
##D 
##D fruits <- c("Banana", "Blueberry", "Cherry",
##D             "Coconut", "Grapefruit", "Kiwi",
##D             "Lemon", "Lime", "Mango", "Orange",
##D             "Papaya")
##D 
##D ui <- fluidPage(
##D   tags$h2("Multi update"),
##D   multiInput(
##D     inputId = "my_multi",
##D     label = "Fruits :",
##D     choices = fruits,
##D     selected = "Banana",
##D     width = "350px"
##D   ),
##D   verbatimTextOutput(outputId = "res"),
##D   selectInput(
##D     inputId = "selected",
##D     label = "Update selected:",
##D     choices = fruits,
##D     multiple = TRUE
##D   ),
##D   textInput(inputId = "label", label = "Update label:")
##D )
##D 
##D server <- function(input, output, session) {
##D 
##D   output$res <- renderPrint(input$my_multi)
##D 
##D   observeEvent(input$selected, {
##D     updateMultiInput(
##D       session = session,
##D       inputId = "my_multi",
##D       selected = input$selected
##D     )
##D   })
##D 
##D   observeEvent(input$label, {
##D     updateMultiInput(
##D       session = session,
##D       inputId = "my_multi",
##D       label = input$label
##D     )
##D   }, ignoreInit = TRUE)
##D }
##D 
##D shinyApp(ui, server)
##D 
##D }
##D 
## End(Not run)



