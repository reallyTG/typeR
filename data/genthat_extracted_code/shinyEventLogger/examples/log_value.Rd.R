library(shinyEventLogger)


### Name: log_value
### Title: Logging value
### Aliases: log_value

### ** Examples

if (interactive()) {
  set_logging()
  shiny::shinyApp(
    ui = shiny::fluidPage(log_init()),
    server = function(input, output) {
      set_logging_session()
      log_value(NROW(mtcars))
    }
  )

}



