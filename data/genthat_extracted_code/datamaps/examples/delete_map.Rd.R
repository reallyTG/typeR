library(datamaps)


### Name: delete_map
### Title: Remove map
### Aliases: delete_map

### ** Examples

## Not run: 
##D library(shiny)
##D 
##D ui <- fluidPage(
##D   actionButton(
##D     "delete",
##D     "Delete map"
##D   ),
##D   datamapsOutput("map")
##D )
##D 
##D server <- function(input, output){
##D   output$map <- renderDatamaps({
##D     datamaps()
##D   })
##D }
##D 
##D shinyApp(ui, server)
## End(Not run)




