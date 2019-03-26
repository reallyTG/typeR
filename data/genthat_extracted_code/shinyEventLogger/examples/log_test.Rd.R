library(shinyEventLogger)


### Name: log_test
### Title: Logging unit test
### Aliases: log_test

### ** Examples

## No test: 
if (interactive()) {
  set_logging()
  shiny::shinyApp(
    ui = shiny::fluidPage(log_init()),
    server = function(input, output) {
      set_logging_session()
      log_test(testthat::expect_true(TRUE))
      log_test(testthat::expect_true(FALSE))
    }
  )
}
## End(No test)



