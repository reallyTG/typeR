library(shinyEventLogger)


### Name: set_logging
### Title: Settings for event logging
### Aliases: set_logging

### ** Examples

if (interactive()) {

  set_logging(r_console = TRUE,
              js_console = FALSE,
              "param_1" = 1,
              "param_2" = "A")

  shiny::shinyApp(
    ui = shiny::fluidPage(),
    server = function(input, output) {
      set_logging_session()
      log_event("Event with global params")
    }
  )
}



