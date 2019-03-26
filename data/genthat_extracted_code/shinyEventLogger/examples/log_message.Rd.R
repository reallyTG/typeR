library(shinyEventLogger)


### Name: log_message
### Title: Logging a message
### Aliases: log_message log_warning log_error

### ** Examples

if (interactive()) {
  set_logging()
  shiny::shinyApp(
    ui = shiny::fluidPage(log_init()),
    server = function(input, output) {
      set_logging_session()
      log_message("Example of a message")
      log_warning("Example of a warning")
      log_error("Example of an error")
    }
  )
}



