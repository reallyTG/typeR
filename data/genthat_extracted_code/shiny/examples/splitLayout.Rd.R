library(shiny)


### Name: splitLayout
### Title: Split layout
### Aliases: splitLayout

### ** Examples

## Only run examples in interactive R sessions
if (interactive()) {
options(device.ask.default = FALSE)

# Server code used for all examples
server <- function(input, output) {
  output$plot1 <- renderPlot(plot(cars))
  output$plot2 <- renderPlot(plot(pressure))
  output$plot3 <- renderPlot(plot(AirPassengers))
}

# Equal sizing
ui <- splitLayout(
  plotOutput("plot1"),
  plotOutput("plot2")
)
shinyApp(ui, server)

# Custom widths
ui <- splitLayout(cellWidths = c("25%", "75%"),
  plotOutput("plot1"),
  plotOutput("plot2")
)
shinyApp(ui, server)

# All cells at 300 pixels wide, with cell padding
# and a border around everything
ui <- splitLayout(
  style = "border: 1px solid silver;",
  cellWidths = 300,
  cellArgs = list(style = "padding: 6px"),
  plotOutput("plot1"),
  plotOutput("plot2"),
  plotOutput("plot3")
)
shinyApp(ui, server)
}



