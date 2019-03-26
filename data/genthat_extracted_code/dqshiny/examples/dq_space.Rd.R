library(dqshiny)


### Name: dq_space
### Title: Create an empty div for spacing
### Aliases: dq_space

### ** Examples

## Only run examples in interactive R sessions
if (interactive()) {

library(shiny)
shinyApp(
  ui = fluidPage(
    fluidRow(
      dq_box(title = "I need space!!", dqSpace(200)),
      dq_box(
      title = "I need more space", collapsible = TRUE, collapsed = TRUE,
            "...but I'm collapsible!", dqSpace("50vh")
            )
    )),
  server = function(input, output) {
  }
)

}



