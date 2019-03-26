library(vegawidget)


### Name: vw_handler_add_effect
### Title: Add a side-effect to a JavaScript handler
### Aliases: vw_handler_add_effect

### ** Examples

  # list all the available effect-handlers
  vw_handler_add_effect()

  # build a signal handler that prints some text,
  # then the value, to the console
  vw_handler_signal("value") %>%
    vw_handler_add_effect("console", label = "signal value:")




