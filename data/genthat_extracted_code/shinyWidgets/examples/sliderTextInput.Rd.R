library(shinyWidgets)


### Name: sliderTextInput
### Title: Slider Text Input Widget
### Aliases: sliderTextInput

### ** Examples

## Not run: 
##D 
##D if (interactive()) {
##D 
##D library("shiny")
##D library("shinyWidgets")
##D 
##D ui <- fluidPage(
##D   br(),
##D   sliderTextInput(
##D     inputId = "mySliderText",
##D     label = "Month range slider:",
##D     choices = month.name,
##D     selected = month.name[c(4, 7)]
##D   ),
##D   verbatimTextOutput(outputId = "result")
##D )
##D 
##D server <- function(input, output, session) {
##D   output$result <- renderPrint(str(input$mySliderText))
##D }
##D 
##D shinyApp(ui = ui, server = server)
##D 
##D }
##D 
## End(Not run)



