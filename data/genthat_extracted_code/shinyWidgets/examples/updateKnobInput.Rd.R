library(shinyWidgets)


### Name: updateKnobInput
### Title: Change the value of a knob input on the client
### Aliases: updateKnobInput

### ** Examples

## Not run: 
##D 
##D if (interactive()) {
##D 
##D library("shiny")
##D library("shinyWidgets")
##D 
##D ui <- fluidPage(
##D   tags$h1("knob update examples"),
##D   br(),
##D 
##D   fluidRow(
##D 
##D     column(
##D       width = 6,
##D       knobInput(
##D         inputId = "knob1", label = "Update value:",
##D         value = 75, angleOffset = 90, lineCap = "round"
##D       ),
##D       verbatimTextOutput(outputId = "res1"),
##D       sliderInput(
##D         inputId = "upknob1", label = "Update knob:",
##D         min = 0, max = 100, value = 75
##D       )
##D     ),
##D 
##D     column(
##D       width = 6,
##D       knobInput(
##D         inputId = "knob2", label = "Update label:",
##D         value = 50, angleOffset = -125, angleArc = 250
##D       ),
##D       verbatimTextOutput(outputId = "res2"),
##D       textInput(inputId = "upknob2", label = "Update label:")
##D     )
##D 
##D   )
##D )
##D 
##D server <- function(input, output, session) {
##D 
##D   output$res1 <- renderPrint(input$knob1)
##D 
##D   observeEvent(input$upknob1, {
##D     updateKnobInput(
##D       session = session,
##D       inputId = "knob1",
##D       value = input$upknob1
##D     )
##D   }, ignoreInit = TRUE)
##D 
##D 
##D   output$res2 <- renderPrint(input$knob2)
##D   observeEvent(input$upknob2, {
##D     updateKnobInput(
##D       session = session,
##D       inputId = "knob2",
##D       label = input$upknob2
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



