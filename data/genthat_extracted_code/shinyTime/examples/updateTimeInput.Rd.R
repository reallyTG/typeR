library(shinyTime)


### Name: updateTimeInput
### Title: Change a time input on the client
### Aliases: updateTimeInput

### ** Examples

## Only run examples in interactive R sessions
if (interactive()) {

ui <- fluidPage(
  timeInput("time", "Time:"),
  actionButton("to_current_time", "Current time")
)

server <- function(input, output, session) {
  observeEvent(input$to_current_time, {
    updateTimeInput(session, "time", value = Sys.time())
  })
}

shinyApp(ui, server)
}




