library(datamaps)


### Name: update_choropleth
### Title: Dynamically add bubbles
### Aliases: update_choropleth

### ** Examples

## Not run: 
##D library(shiny)
##D 
##D ui <- fluidPage(
##D   selectInput(
##D     "countrySelect",
##D     "Select Country",
##D     choices = c("USA", "FRA", "CHN", "RUS", "COG", "DZA", "BRA", "IND")
##D   ),
##D   sliderInput(
##D     "value",
##D     "Value",
##D     min = 1,
##D     max = 10,
##D     value = 5
##D   ),
##D   actionButton("update", "Update"),
##D   datamapsOutput("map")
##D )
##D 
##D server <- function(input, output){
##D 
##D   data <- data.frame(name = c("USA", "FRA", "CHN", "RUS", "COG", "DZA", "BRA", "IND", "ALG", "AFG"),
##D                      color = 1:10)
##D 
##D  updated_data <- reactive({
##D    data.frame(name = input$countrySelect, value = input$value)
##D  })
##D 
##D   output$map <- renderDatamaps({
##D     data %>%
##D       datamaps() %>%
##D       add_choropleth(name, color)
##D   })
##D 
##D   observeEvent(input$update, {
##D     datamapsProxy("map") %>%
##D       add_data(updated_data()) %>% # pass updated data
##D       update_choropleth(name, value, TRUE) # update
##D   })
##D }
##D 
##D shinyApp(ui, server)
## End(Not run)




