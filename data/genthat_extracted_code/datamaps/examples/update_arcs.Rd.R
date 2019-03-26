library(datamaps)


### Name: update_arcs
### Title: Dynamically update arcs
### Aliases: update_arcs update_arcs_name

### ** Examples

## Not run: 
##D library(shiny)
##D 
##D ui <- fluidPage(
##D 
##D   textInput(
##D     "from",
##D     "Origin",
##D     value = "USA"
##D   ),
##D   textInput(
##D     "to",
##D     "Destination",
##D     value = "RUS"
##D   ),
##D   actionButton(
##D     "submit",
##D     "Draw arc"
##D   ),
##D   datamapsOutput("map")
##D )
##D 
##D server <- function(input, output){
##D 
##D   arc <- reactive({
##D     data.frame(from = input$from, to = input$to)
##D   })
##D 
##D  output$map <- renderDatamaps({
##D    datamaps()
##D  })
##D 
##D  observeEvent(input$submit, {
##D    datamapsProxy("map") %>%
##D      add_data(arc()) %>%
##D      update_arcs_name(from, to)
##D  })
##D 
##D }
##D 
##D shinyApp(ui, server)
## End(Not run)




