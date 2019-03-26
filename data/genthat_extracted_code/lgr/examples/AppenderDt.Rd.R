library(lgr)


### Name: AppenderDt
### Title: Log to an In-Memory Data.Table
### Aliases: AppenderDt lgr_data

### ** Examples

lg <- Logger$new(
  "test",
  appenders = list(memory = AppenderDt$new()),
  threshold = NA,
  parent = NULL  # to prevent routing to root logger for this example
)
lg$debug("test")
lg$error("test")

# Displaying the log
lg$appenders$memory$data
lg$appenders$memory$show()
show_log(target = lg$appenders$memory)

# If you pass a Logger to show_log(), it looks for the first AppenderDt
# that it can find.
show_log(target = lg)

# Custom fields are stored in the list column .custom by default
lg$info("the iris data frame", caps = LETTERS[1:5])
lg$appenders$memory$data
lg$appenders$memory$data$.custom[[3]]$caps




