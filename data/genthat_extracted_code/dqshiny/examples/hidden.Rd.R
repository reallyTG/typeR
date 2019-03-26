library(dqshiny)


### Name: hidden
### Title: Sets the initial state of all given tags
### Aliases: hidden disabled

### ** Examples

## Only run examples in interactive R sessions
if (interactive()) {

library(shiny)
shinyApp(
  ui = fluidPage(
    init(),
    actionButton("btn1", "Toggle Display"),
    actionButton("btn2", "Toggle State"),
    hidden(disabled(actionButton("btn3", "Hello")))
  ),
  server = function(input, output) {
    observeEvent(input$btn1, toggle("btn3"))
    observeEvent(input$btn2, toggle_state("btn3"))
  }
)

}



