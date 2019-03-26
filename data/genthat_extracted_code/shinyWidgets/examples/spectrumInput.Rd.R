library(shinyWidgets)


### Name: spectrumInput
### Title: Palette Color Picker with Spectrum Library
### Aliases: spectrumInput

### ** Examples

## Not run: 
##D 
##D if (interactive()) {
##D 
##D library("shiny")
##D library("shinyWidgets")
##D library("RColorBrewer")
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
##D       list('black', 'white', 'blanchedalmond', 'steelblue', 'forestgreen'),
##D       as.list(brewer.pal(n = 9, name = "Blues")),
##D       as.list(brewer.pal(n = 9, name = "Greens")),
##D       as.list(brewer.pal(n = 11, name = "Spectral")),
##D       as.list(brewer.pal(n = 8, name = "Dark2"))
##D     ),
##D     options = list(`toggle-palette-more-text` = "Show more")
##D   ),
##D   verbatimTextOutput(outputId = "res")
##D 
##D )
##D 
##D server <- function(input, output, session) {
##D 
##D   output$res <- renderPrint(input$myColor)
##D 
##D }
##D 
##D shinyApp(ui, server)
##D 
##D }
##D 
## End(Not run)



