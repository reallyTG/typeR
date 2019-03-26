library(datamaps)


### Name: update_legend
### Title: Dynamically update legend
### Aliases: update_legend

### ** Examples

## Not run: 
##D library(shiny)
##D 
##D ui <- fluidPage(
##D   actionButton(
##D     "show",
##D     "Show legend"
##D   ),
##D   datamapsOutput("map")
##D )
##D 
##D server <- function(input, output){
##D   states <- data.frame(st = c("AR", "NY", "CA", "IL", "CO", "MT", "TX"),
##D                        val = c(10, 5, 3, 8, 6, 7, 2))
##D 
##D   output$map <- renderDatamaps({
##D     states %>%
##D       datamaps(scope = "usa", default = "lightgray") %>%
##D       add_choropleth(st, val)
##D   })
##D 
##D   observeEvent(input$update, {
##D     datamapsProxy("map") %>%
##D       update_legend() # update
##D   })
##D }
##D 
##D shinyApp(ui, server)
## End(Not run)




