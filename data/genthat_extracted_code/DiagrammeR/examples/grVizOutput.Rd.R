library(DiagrammeR)


### Name: grVizOutput
### Title: Widget output function for use in Shiny
### Aliases: grVizOutput

### ** Examples

## Not run: 
##D library(shiny)
##D library(shinyAce)
##D 
##D ui = shinyUI(fluidPage(fluidRow(
##D   column(
##D     width=4
##D     , aceEditor("ace", selectionId = "selection", value="digraph {A;}")
##D   ),
##D   column(
##D     width = 6
##D     , grVizOutput('diagram' )
##D   )
##D )))
##D 
##D server = function(input, output) {
##D   output$diagram <- renderGrViz({
##D     grViz(
##D       input$ace
##D     )
##D   })
##D 
##D }
##D 
##D shinyApp(ui = ui, server = server)
## End(Not run)



