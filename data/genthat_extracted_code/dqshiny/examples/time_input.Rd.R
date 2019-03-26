library(dqshiny)


### Name: time_input
### Title: Creates a time input field
### Aliases: time_input update_time_input

### ** Examples

## Only run examples in interactive R sessions
if (interactive()) {

library(shiny)
shinyApp(
  ui = fluidPage(
    fluidRow(
      column(3,
        time_input("time1", "Simple:", value = "12:34"),
        time_input("time2", "Fancy:", use_material_picker = TRUE),
        actionButton("update", "Update")
      )
    )
  ),
  server = function(input, output, session) {
    observeEvent(input$update, {
      update_time_input(session, "time2", value = "12:34")
    })
  }
)

}



