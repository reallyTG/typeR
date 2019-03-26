library(shinyWidgets)


### Name: updateSliderTextInput
### Title: Change the value of a slider text input on the client
### Aliases: updateSliderTextInput

### ** Examples

## Not run: 
##D 
##D if (interactive()) {
##D library("shiny")
##D library("shinyWidgets")
##D 
##D ui <- fluidPage(
##D   br(),
##D   sliderTextInput(
##D     inputId = "mySlider",
##D     label = "Pick a month :",
##D     choices = month.abb,
##D     selected = "Jan"
##D   ),
##D   verbatimTextOutput(outputId = "res"),
##D   radioButtons(
##D     inputId = "up",
##D     label = "Update choices:",
##D     choices = c("Abbreviations", "Full names")
##D   )
##D )
##D 
##D server <- function(input, output, session) {
##D   output$res <- renderPrint(str(input$mySlider))
##D 
##D   observeEvent(input$up, {
##D     choices <- switch(
##D       input$up,
##D       "Abbreviations" = month.abb,
##D       "Full names" = month.name
##D     )
##D     updateSliderTextInput(
##D       session = session,
##D       inputId = "mySlider",
##D       choices = choices
##D     )
##D   }, ignoreInit = TRUE)
##D }
##D 
##D shinyApp(ui = ui, server = server)
##D }
##D 
## End(Not run)



