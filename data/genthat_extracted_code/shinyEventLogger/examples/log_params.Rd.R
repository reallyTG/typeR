library(shinyEventLogger)


### Name: log_params
### Title: Logging scope-specific parameters of events
### Aliases: log_params

### ** Examples

if (interactive()) {
  set_logging()
  shiny::shinyApp(
    ui = shiny::fluidPage(log_init()),
    server = function(input, output) {
      set_logging_session()
      observe({
        log_params("observer" = "A")
        log_event("Event A.1")
        log_event("Event A.2")
      })
      observe({
        log_params("observer" = "B")
        log_event("Event B.1")
        log_event("Event B.2")
      })
    }
  )
}



