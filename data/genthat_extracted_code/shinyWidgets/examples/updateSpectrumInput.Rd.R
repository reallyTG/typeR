library(shinyWidgets)


### Name: updateSpectrumInput
### Title: Change the value of a spectrum input on the client
### Aliases: updateSpectrumInput

### ** Examples

## Not run: 
##D 
##D if (interactive()) {
##D 
##D library("shiny")
##D library("shinyWidgets")
##D 
##D ui <- fluidPage(
##D   tags$h1("Spectrum color picker"),
##D 
##D   br(),
##D 
##D   spectrumInput(
##D     inputId = "myColor",
##D     label = "Pick a color:",
##D     choices = list(
##D       list('black', 'white', 'blanchedalmond', 'steelblue', 'forestgreen')
##D     )
##D   ),
##D   verbatimTextOutput(outputId = "res"),
##D   radioButtons(
##D     inputId = "update", label = "Update:",
##D     choices = c(
##D       'black', 'white', 'blanchedalmond', 'steelblue', 'forestgreen'
##D     )
##D 
##D   )
##D 
##D )
##D 
##D server <- function(input, output, session) {
##D 
##D   output$res <- renderPrint(input$myColor)
##D 
##D   observeEvent(input$update, {
##D     updateSpectrumInput(session = session, inputId = "myColor", selected = input$update)
##D   }, ignoreInit = TRUE)
##D 
##D }
##D 
##D shinyApp(ui, server)
##D 
##D }
##D 
## End(Not run)



