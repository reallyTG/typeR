library(dqshiny)


### Name: add_class
### Title: Change the state of a shiny interface element
### Aliases: add_class remove_class toggle_class

### ** Examples

## Only run examples in interactive R sessions
if (interactive()) {

library(shiny)
shinyApp(
  ui = fluidPage(
    tags$head(tags$style(".orange{background:#ff8f00}")),
    actionButton("add", "Add Class"),
    actionButton("remove", "Remove Class"),
    actionButton("toggle", "Toggle Class"),
    actionButton("toggle_cond", "Toggle Class with Condition"),
    checkboxInput("condition", "orange"),
    fluidRow(id = "row",
      dq_space(), # this is needed to make everything work
      actionButton("example", "EXAMPLE"),
      dq_space() # this is just for the alignment ;)
   )
  ),
  server = function(input, output) {
    observeEvent(input$add, add_class("row", "orange"))
    observeEvent(input$remove, remove_class("row", "orange"))
    observeEvent(input$toggle, toggle_class("row", "orange"))
    observeEvent(
      input$toggle_cond,
      toggle_class("row", "orange", input$condition)
    )
  }
)

}



