library(shinyEventLogger)


### Name: log_event
### Title: Logging an event
### Aliases: log_event

### ** Examples

if (interactive()) {
  set_logging()
  shiny::shinyApp(
    ui = shiny::fluidPage(log_init()),
    server = function(input, output) {
      set_logging_session()
      log_event("Event 1")
      log_event("Event 2 body", name = "Event 2")
      log_event("Event 3", type = "NewTYPE")
      log_event("Event 4", status = "EXECUTED")
      log_event("Event 5", event_counter = 123)
    }
  )
}



