library(shiny)


### Name: updateSliderInput
### Title: Change the value of a slider input on the client
### Aliases: updateSliderInput

### ** Examples

## Only run this example in interactive R sessions
if (interactive()) {
  shinyApp(
    ui = fluidPage(
      sidebarLayout(
        sidebarPanel(
          p("The first slider controls the second"),
          sliderInput("control", "Controller:", min=0, max=20, value=10,
                       step=1),
          sliderInput("receive", "Receiver:", min=0, max=20, value=10,
                       step=1)
        ),
        mainPanel()
      )
    ),
    server = function(input, output, session) {
      observe({
        val <- input$control
        # Control the value, min, max, and step.
        # Step size is 2 when input value is even; 1 when value is odd.
        updateSliderInput(session, "receive", value = val,
          min = floor(val/2), max = val+4, step = (val+1)%%2 + 1)
      })
    }
  )
}



