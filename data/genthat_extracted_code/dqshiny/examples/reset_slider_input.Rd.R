library(dqshiny)


### Name: reset_slider_input
### Title: Function to reset a slider input
### Aliases: reset_slider_input

### ** Examples

## Only run examples in interactive R sessions
if (interactive()) {

library(shiny)
shinyApp(
  ui = fluidPage(
    init(),
    sliderInput("mySlider", "Change me", 0, 200, c(90, 117)),
    actionButton("btn1", "Reset slider")
  ),
  server = function(input, output) {
    observeEvent(input$btn1, reset_slider_input("mySlider"))
  }
)

}



