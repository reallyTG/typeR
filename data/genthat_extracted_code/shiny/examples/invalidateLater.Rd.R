library(shiny)


### Name: invalidateLater
### Title: Scheduled Invalidation
### Aliases: invalidateLater

### ** Examples

## Only run examples in interactive R sessions
if (interactive()) {

ui <- fluidPage(
  sliderInput("n", "Number of observations", 2, 1000, 500),
  plotOutput("plot")
)

server <- function(input, output, session) {

  observe({
    # Re-execute this reactive expression after 1000 milliseconds
    invalidateLater(1000, session)

    # Do something each time this is invalidated.
    # The isolate() makes this observer _not_ get invalidated and re-executed
    # when input$n changes.
    print(paste("The value of input$n is", isolate(input$n)))
  })

  # Generate a new histogram at timed intervals, but not when
  # input$n changes.
  output$plot <- renderPlot({
    # Re-execute this reactive expression after 2000 milliseconds
    invalidateLater(2000)
    hist(rnorm(isolate(input$n)))
  })
}

shinyApp(ui, server)
}



