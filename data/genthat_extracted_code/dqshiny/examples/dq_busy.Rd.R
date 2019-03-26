library(dqshiny)


### Name: dq_busy
### Title: Adds a loading image if shiny is busy
### Aliases: dq_busy

### ** Examples

## Only run examples in interactive R sessions
if (interactive()) {

library(shiny)
shinyApp(
  ui = fluidPage(
    dq_busy(time = 1500),
    actionButton("button", "make me busy")
  ),
  server = function(input, output) {
    observeEvent(input$button, Sys.sleep(3))
  }
)

}



