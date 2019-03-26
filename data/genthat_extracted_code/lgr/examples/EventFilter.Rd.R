library(lgr)


### Name: EventFilter
### Title: Event Filters
### Aliases: EventFilter Filter FilterInject FilterForceLevel

### ** Examples

# using filters to modify log events
analyse <- function(){
  lgr$add_filter(FilterForceLevel$new("info"), "force")
  lgr$add_filter(FilterInject$new(type = "analysis"), "inject")
  on.exit(lgr$remove_filter(c("force", "inject")))
  lgr$debug("a debug message")
  lgr$error("an error")
}
analyse()
lgr$error("an error")


# using .obj()
l <- Logger$new("foo", threshold = "debug")
f <- function(event) {
  cat("via event$.logger:", event$.logger$threshold, "\n")  #  works for loggers only
  cat("via .obj():      ",.obj()$threshold, "\n") # works for loggers and appenders
  TRUE
}
l$add_filter(f)
l$fatal("test")



