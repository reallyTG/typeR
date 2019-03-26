library(dqshiny)


### Name: hide
### Title: Change the state of a shiny interface element
### Aliases: hide show toggle

### ** Examples

## Only run examples in interactive R sessions
if (interactive()) {

library(shiny)
shinyApp(
  ui = fluidPage(
    init(),
    actionButton("hide", "Hide"),
    actionButton("show", "Show"),
    actionButton("toggle", "Toggle"),
    actionButton("toggle_cond", "Toggle Visibility with Condition"),
    actionButton("toggle_all", "Toggle All Visibilities"),
    checkboxInput("condition", "Visible"),
    actionButton("example1", "EXAMPLE1"),
    actionButton("example2", "EXAMPLE2"),
    actionButton("example3", "EXAMPLE3")
  ),
  server = function(input, output) {
    observeEvent(input$hide, hide("example1"))
    observeEvent(input$show, show("example1"))
    observeEvent(input$toggle, toggle("example1"))
    observeEvent(input$toggle_cond,
      toggle("example1", input$condition)
    )
    observeEvent(input$toggle_all,
      toggle(c("example1", "example2", "example3"))
    )
  }
)

}



