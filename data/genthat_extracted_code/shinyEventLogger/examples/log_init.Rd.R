library(shinyEventLogger)


### Name: log_init
### Title: Initialize logging to JavaScript console
### Aliases: log_init

### ** Examples

if (interactive()) {
  set_logging(js_console = TRUE)
  shiny::shinyApp(
    ui = shiny::fluidPage(log_init()),
    server = function(input, output) {
      set_logging_session()
      log_event("See browser JavaScript console (CTRL + SHIFT + I)")
    }
  )
}



