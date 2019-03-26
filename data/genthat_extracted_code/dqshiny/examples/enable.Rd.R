library(dqshiny)


### Name: enable
### Title: Change the state of a shiny interface element
### Aliases: enable disable toggle_state

### ** Examples

## Only run examples in interactive R sessions
if (interactive()) {

library(shiny)
shinyApp(
  ui = fluidPage(
    actionButton("btn_enable", "Enable"),
    actionButton("btn_disable", "Disable"),
    actionButton("btn_toggle", "Toggle State"),
    actionButton("btn_toggle_cond", "Toggle State with Condition"),
    actionButton("btn_toggle_all", "Toggle All States"),
    checkboxInput("condition", "Disabled"),
    dq_space(), # this is needed to make everything work
    actionButton("example1", "EXAMPLE1"),
    actionButton("example2", "EXAMPLE2"),
    actionButton("example3", "EXAMPLE3")
  ),
  server = function(input, output) {
    observeEvent(input$btn_enable, enable("example1"))
    observeEvent(input$btn_disable, disable("example1"))
    observeEvent(input$btn_toggle, toggle_state("example1"))
    observeEvent(input$btn_toggle_cond,
      toggle_state("example1", input$condition)
    )
    observeEvent(input$btn_toggle_all,
      toggle_state(c("example1", "example2", "example3"))
    )
  }
)

}



