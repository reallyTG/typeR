library(shinyWidgets)


### Name: wNumbFormat
### Title: Format numbers in noUiSliderInput
### Aliases: wNumbFormat

### ** Examples

## Not run: 
##D 
##D if (interactive()) {
##D 
##D library( shiny )
##D library( shinyWidgets )
##D 
##D ui <- fluidPage(
##D   tags$h3("Format numbers"),
##D   tags$br(),
##D 
##D   noUiSliderInput(
##D     inputId = "form1",
##D     min = 0, max = 10000,
##D     value = 800,
##D     format = wNumbFormat(decimals = 3,
##D                          thousand = ".",
##D                          suffix = " (US $)")
##D   ),
##D   verbatimTextOutput(outputId = "res1"),
##D 
##D   tags$br(),
##D 
##D   noUiSliderInput(
##D     inputId = "form2",
##D     min = 1988, max = 2018,
##D     value = 1988,
##D     format = wNumbFormat(decimals = 0,
##D                          thousand = "",
##D                          prefix = "Year: ")
##D   ),
##D   verbatimTextOutput(outputId = "res2"),
##D 
##D   tags$br()
##D 
##D )
##D 
##D server <- function(input, output, session) {
##D 
##D   output$res1 <- renderPrint(input$form1)
##D   output$res2 <- renderPrint(input$form2)
##D 
##D }
##D 
##D shinyApp(ui, server)
##D 
##D }
##D 
## End(Not run)



