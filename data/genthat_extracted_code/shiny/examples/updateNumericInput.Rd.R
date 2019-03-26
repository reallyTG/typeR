library(shiny)


### Name: updateNumericInput
### Title: Change the value of a number input on the client
### Aliases: updateNumericInput

### ** Examples

## Only run examples in interactive R sessions
if (interactive()) {

ui <- fluidPage(
  sliderInput("controller", "Controller", 0, 20, 10),
  numericInput("inNumber", "Input number", 0),
  numericInput("inNumber2", "Input number 2", 0)
)

server <- function(input, output, session) {

  observeEvent(input$controller, {
    # We'll use the input$controller variable multiple times, so save it as x
    # for convenience.
    x <- input$controller

    updateNumericInput(session, "inNumber", value = x)

    updateNumericInput(session, "inNumber2",
      label = paste("Number label ", x),
      value = x, min = x-10, max = x+10, step = 5)
  })
}

shinyApp(ui, server)
}



