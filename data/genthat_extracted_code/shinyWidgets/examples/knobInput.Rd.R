library(shinyWidgets)


### Name: knobInput
### Title: Knob Input
### Aliases: knobInput

### ** Examples

## Not run: 
##D 
##D if (interactive()) {
##D 
##D library("shiny")
##D library("shinyWidgets")
##D 
##D ui <- fluidPage(
##D   knobInput(
##D     inputId = "myKnob",
##D     label = "Display previous:",
##D     value = 50,
##D     min = -100,
##D     displayPrevious = TRUE,
##D     fgColor = "#428BCA",
##D     inputColor = "#428BCA"
##D   ),
##D   verbatimTextOutput(outputId = "res")
##D )
##D 
##D server <- function(input, output, session) {
##D 
##D   output$res <- renderPrint(input$myKnob)
##D 
##D }
##D 
##D shinyApp(ui = ui, server = server)
##D 
##D }
##D 
## End(Not run)



