library(shiny)


### Name: fillRow
### Title: Flex Box-based row/column layouts
### Aliases: fillRow fillCol

### ** Examples

# Only run this example in interactive R sessions.
if (interactive()) {

ui <- fillPage(fillRow(
  plotOutput("plotLeft", height = "100%"),
  fillCol(
    plotOutput("plotTopRight", height = "100%"),
    plotOutput("plotBottomRight", height = "100%")
  )
))

server <- function(input, output, session) {
  output$plotLeft <- renderPlot(plot(cars))
  output$plotTopRight <- renderPlot(plot(pressure))
  output$plotBottomRight <- renderPlot(plot(AirPassengers))
}

shinyApp(ui, server)

}



