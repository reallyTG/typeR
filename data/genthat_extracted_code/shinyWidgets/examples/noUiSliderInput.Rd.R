library(shinyWidgets)


### Name: noUiSliderInput
### Title: Numeric range slider
### Aliases: noUiSliderInput

### ** Examples

## Not run: 
##D 
##D if (interactive()) {
##D 
##D ### examples ----
##D 
##D # see ?demoNoUiSlider
##D demoNoUiSlider("more")
##D 
##D 
##D ###  basic usage ----
##D 
##D library( shiny )
##D library( shinyWidgets )
##D 
##D 
##D ui <- fluidPage(
##D 
##D   tags$br(),
##D 
##D   noUiSliderInput(
##D     inputId = "noui1",
##D     min = 0, max = 100,
##D     value = 20
##D   ),
##D   verbatimTextOutput(outputId = "res1"),
##D 
##D   tags$br(),
##D 
##D   noUiSliderInput(
##D     inputId = "noui2", label = "Slider vertical:",
##D     min = 0, max = 1000, step = 50,
##D     value = c(100, 400), margin = 100,
##D     orientation = "vertical",
##D     width = "100px", height = "300px"
##D   ),
##D   verbatimTextOutput(outputId = "res2")
##D 
##D )
##D 
##D server <- function(input, output, session) {
##D 
##D   output$res1 <- renderPrint(input$noui1)
##D   output$res2 <- renderPrint(input$noui2)
##D 
##D }
##D 
##D shinyApp(ui, server)
##D 
##D 
##D }
##D 
## End(Not run)



