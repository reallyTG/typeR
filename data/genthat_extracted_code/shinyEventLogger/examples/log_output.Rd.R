library(shinyEventLogger)


### Name: log_output
### Title: Logging output of a function
### Aliases: log_output

### ** Examples

if (interactive()) {
  set_logging()
  shiny::shinyApp(
    ui = shiny::fluidPage(log_init()),
    server = function(input, output) {
      set_logging_session()
      log_output(NROW(mtcars))
      log_output(head(mtcars))
    }
  )

}



