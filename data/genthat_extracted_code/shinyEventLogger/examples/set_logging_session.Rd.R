library(shinyEventLogger)


### Name: set_logging_session
### Title: Session-specific settings for event logging
### Aliases: set_logging_session

### ** Examples

if (interactive()) {

  set_logging()
  shiny::shinyApp(
    ui = shiny::fluidPage(log_init()),
    server = function(input, output) {
      set_logging_session(
        session_id = shiny::getDefaultReactiveDomain()$token
        )
      log_event("Event 1 with session parameter")
      log_event("Event 2 with session parameter")
    }
  )
  # You can open app in the browser and duplicate tab to see different
  # unique session ids in event parameters.
}



