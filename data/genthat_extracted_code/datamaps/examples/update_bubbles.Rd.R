library(datamaps)


### Name: update_bubbles
### Title: Dynamically add bubbles
### Aliases: update_bubbles

### ** Examples

## Not run: 
##D library(shiny)
##D 
##D ui <- fluidPage(
##D  numericInput(
##D    "lon",
##D    "Longitude",
##D    value = 50
##D  ),
##D  numericInput(
##D    "lat",
##D    "Latitude",
##D    value = 50
##D  ),
##D  textInput(
##D    "city",
##D    "City",
##D    value = "City"
##D  ),
##D  sliderInput(
##D    "value",
##D    "Value",
##D    min = 1,
##D    max = 4,
##D    step = 1,
##D    value = 3
##D  ),
##D  actionButton(
##D    "sub",
##D    "Submit"
##D  ),
##D  datamapsOutput("map")
##D )
##D 
##D server <- function(input, output){
##D 
##D   coords <- data.frame(city = c("London", "New York", "Beijing", "Sydney"),
##D                        lon = c(-0.1167218, -73.98002, 116.3883, 151.18518),
##D                        lat = c(51.49999, 40.74998, 39.92889, -33.92001),
##D                        values = 1:4)
##D 
##D   update <- reactive({
##D     df <- data.frame(city = input$city, lon = input$lon, lat = input$lat, values = input$value)
##D     rbind.data.frame(coords, df)
##D   })
##D 
##D   output$map <- renderDatamaps({
##D     coords %>%
##D       datamaps() %>%
##D       add_bubbles(lon, lat, values * 2, values, city)
##D   })
##D 
##D   observeEvent(input$sub, {
##D     datamapsProxy("map") %>%
##D       add_data(update()) %>% # pass updated data
##D       update_bubbles(lon, lat, values * 2, values, city) # update
##D   })
##D 
##D }
##D 
##D shinyApp(ui, server)
## End(Not run)




