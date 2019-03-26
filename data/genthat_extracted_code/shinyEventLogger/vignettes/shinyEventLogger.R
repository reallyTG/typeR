## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  echo = TRUE,
  eval = FALSE,
  cache = FALSE
)

## ------------------------------------------------------------------------
#  library(shiny)
#  library(shinyEventLogger)

## ------------------------------------------------------------------------
#  set_logging()

## ------------------------------------------------------------------------
#  set_logging()
#  shinyApp(
#    ui = fluidPage(),
#    server = function(input, output) {
#      set_logging_session()
#   }
#  )

## ------------------------------------------------------------------------
#  set_logging()
#  shinyApp(
#    ui = fluidPage(),
#    server = function(input, output) {
#      set_logging_session()
#      log_event("Hello World!")
#   }
#  )

## ------------------------------------------------------------------------
#  set_logging()
#  shinyApp(
#    ui = fluidPage(
#      log_init()
#    ),
#    server = function(input, output) {
#      set_logging_session()
#      log_event("Hello World!")
#      log_event("See browser JavaScript console (CTRL + SHIFT + I)")
#   }
#  )

## ------------------------------------------------------------------------
#  set_logging()
#  shinyApp(
#    ui = fluidPage(log_init()),
#    server = function(input, output) {
#      set_logging_session()
#      log_event("Event body",
#                name   = "Event name",
#                type   = "NEWTYPE",
#                status = "NEWSTATUS",
#                params = list("param_1" = "param_1_value"))
#   }
#  )

## ------------------------------------------------------------------------
#  set_logging()
#  shinyApp(
#    ui = fluidPage(log_init()),
#    server = function(input, output) {
#      set_logging_session()
#      log_event("Event body", name   = "Event name")
#      log_event("Event without name")
#      log_event(paste("Event", "without", "name"))
#      log_event("Event", "without", "name")
#   }
#  )

## ------------------------------------------------------------------------
#  set_logging()
#  shinyApp(
#    ui = fluidPage(
#      log_init(),
#      selectInput("number", "Select number", choices = c(1, 2, 3), selected = 2)
#      ),
#    server = function(input, output) {
#      set_logging_session()
#      log_value(NROW(mtcars))
#      observe({
#        log_value(input$number)
#      })
#   }
#  )

## ------------------------------------------------------------------------
#  set_logging()
#  shinyApp(
#    ui = fluidPage(log_init()),
#    server = function(input, output) {
#      set_logging_session()
#      log_output(head(mtcars))
#      log_output(str(mtcars))
#   }
#  )

## ------------------------------------------------------------------------
#  set_logging()
#  shinyApp(
#    ui = fluidPage(log_init()),
#    server = function(input, output) {
#      set_logging_session()
#      log_test(testthat::expect_true(TRUE))
#      log_test(testthat::expect_true(FALSE))
#      log_test(testthat::expect_true(TRUE))
#   }
#  )

## ------------------------------------------------------------------------
#  set_logging()
#  shinyApp(
#    ui = fluidPage(log_init()),
#    server = function(input, output) {
#      set_logging_session()
#      log_message("Example of a message")
#      log_warning("Example of a warning")
#      log_error("Example of an error")
#   }
#  )

## ------------------------------------------------------------------------
#  set_logging(js_console = FALSE)
#  shinyApp(
#    ui = shiny::fluidPage(log_init()),
#    server = function(input, output) {
#      options(digits.secs = 6)
#      set_logging_session()
#        log_started("Event 1")
#          log_event("Sleeping for 3 secs...")
#          Sys.sleep(3)
#        log_done("Event 1")
#    }
#  )

## ------------------------------------------------------------------------
#  set_logging(js_console = FALSE)
#  shinyApp(
#    ui = shiny::fluidPage(),
#    server = function(input, output) {
#      set_logging_session()
#      log_started("Event 1")
#        Sys.sleep(1)
#          log_started("Event 2")
#          Sys.sleep(1)
#          log_done("Event 2")
#        Sys.sleep(1)
#      log_done("Event 1")
#    }
#  )

## ------------------------------------------------------------------------
#  set_logging()
#  shinyApp(
#    ui = fluidPage(
#      log_init(),
#      selectInput("number", "Select number", choices = c(1, 2, 3), selected = 2)
#      ),
#    server = function(input, output) {
#      set_logging_session()
#      log_event("mtcars", params = list(dim = dim(mtcars)))
#      observe({
#        log_event("number changed", params = list(number = input$number))
#      })
#   }
#  )

## ------------------------------------------------------------------------
#  set_logging()
#  shinyApp(
#    ui = fluidPage(
#      log_init(),
#      selectInput("number", "Select number", choices = c(1, 2, 3), selected = 2)
#      ),
#    server = function(input, output) {
#      set_logging_session()
#      log_event("mtcars", params = list(dim = dim(mtcars)))
#      observe({
#        log_params(number = input$number)
#        log_event("number changed")
#        log_event("number changed indeed")
#      })
#    }
#  )

## ------------------------------------------------------------------------
#  set_logging()
#  shinyApp(
#    ui = fluidPage(
#      log_init(),
#      selectInput("number", "Select number", choices = c(1, 2, 3), selected = 2)
#      ),
#    server = function(input, output) {
#      set_logging_session(unique_id = runif(1))
#      log_event("mtcars", params = list(dim = dim(mtcars)))
#      observe({
#        log_params(number = input$number)
#        log_event("number changed")
#        log_event("number changed indeed")
#      })
#    }
#  )

## ------------------------------------------------------------------------
#  set_logging(
#    logger_ver = as.character(packageVersion("ShinyEventLogger")),
#    build = 123L
#  )
#  shinyApp(
#    ui = fluidPage(
#      log_init(),
#      selectInput("number", "Select number", choices = c(1, 2, 3), selected = 2)
#      ),
#    server = function(input, output) {
#      set_logging_session(unique_id = runif(1))
#      log_event("mtcars", params = list(dim = dim(mtcars)))
#      observe({
#        log_params(number = input$number)
#        log_event("number changed")
#        log_event("number changed indeed")
#      })
#    }
#  )

