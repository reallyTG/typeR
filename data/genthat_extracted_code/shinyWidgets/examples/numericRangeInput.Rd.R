library(shinyWidgets)


### Name: numericRangeInput
### Title: Numeric Range Input
### Aliases: numericRangeInput

### ** Examples

## Not run: 
##D 
##D if (interactive()) {
##D 
##D ### examples ----
##D 
##D # see ?demoNumericRange
##D demoNumericRange()
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
##D   numericRangeInput(
##D     inputId = "noui1", label = "Numeric Range Input:",
##D     value = c(100, 400)
##D   ),
##D   verbatimTextOutput(outputId = "res1")
##D 
##D )
##D 
##D server <- function(input, output, session) {
##D 
##D   output$res1 <- renderPrint(input$noui1)
##D 
##D }
##D 
##D shinyApp(ui, server)
##D 
##D 
##D }
##D 
## End(Not run)



