library(shinyEventLogger)


### Name: log_started
### Title: Logging the start of an event
### Aliases: log_started log_done

### ** Examples

if (interactive()) {
  set_logging()
  shiny::shinyApp(
    ui = shiny::fluidPage(log_init()),
    server = function(input, output) {
      set_logging_session()
        log_started(as.character(Sys.time()), name = "Event 1")
        Sys.sleep(0.5)
          log_started(as.character(Sys.time()), name = "Event 2")
            log_event(as.character(Sys.time()), name = "Event 3")
            Sys.sleep(0.5)
          log_done(as.character(Sys.time()), name = "Event 2")
        log_done(as.character(Sys.time()), name = "Event 1")
    }
  )
}



