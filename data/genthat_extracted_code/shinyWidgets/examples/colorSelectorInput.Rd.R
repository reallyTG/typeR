library(shinyWidgets)


### Name: colorSelectorInput
### Title: Color Selector Input
### Aliases: colorSelectorInput colorSelectorExample colorSelectorDrop

### ** Examples

## Not run: 
##D if (interactive()) {
##D 
##D # Full example
##D colorSelectorExample()
##D 
##D # Simple example
##D ui <- fluidPage(
##D   colorSelectorInput(
##D     inputId = "mycolor1", label = "Pick a color :",
##D     choices = c("steelblue", "cornflowerblue",
##D                 "firebrick", "palegoldenrod",
##D                 "forestgreen")
##D   ),
##D   verbatimTextOutput("result1")
##D )
##D 
##D server <- function(input, output, session) {
##D   output$result1 <- renderPrint({
##D     input$mycolor1
##D   })
##D }
##D 
##D shinyApp(ui = ui, server = server)
##D 
##D }
## End(Not run)



