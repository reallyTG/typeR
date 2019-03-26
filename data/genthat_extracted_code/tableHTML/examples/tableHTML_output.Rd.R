library(tableHTML)


### Name: tableHTML_output
### Title: Implementing tableHTML in shiny
### Aliases: tableHTML_output

### ** Examples

## Not run: 
##D 
##D library(shiny)
##D shinyApp(
##D  ui = fluidPage(
##D   fluidRow(
##D   #leave some spacing
##D   br(),
##D   column(width = 1),
##D   tableHTML_output("mytable"))
##D  ), 
##D server = function(input, output) {
##D  output$mytable <- render_tableHTML( 
##D   tableHTML(mtcars)
##D  )}
##D )
##D 
## End(Not run)




