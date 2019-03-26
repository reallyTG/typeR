library(dqshiny)


### Name: init
### Title: Initializes dqshiny
### Aliases: init

### ** Examples

## Only run examples in interactive R sessions
if (interactive()) {

library(shiny)
shinyApp(
  ui = fluidPage(
    init()
  ),
  server = function(input, output) {}
)

}



