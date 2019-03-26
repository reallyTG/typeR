library(lgr)


### Name: AppenderJson
### Title: Log to a JSON File
### Aliases: AppenderJson

### ** Examples

tf <- tempfile()
l <- Logger$new("testlogger", appenders = AppenderJson$new(tf), propagate = FALSE)

l$info("A test message")
l$info("A test message %s strings", "with format strings", and = "custom_fields")

l$appenders[[1]]$show()
l$appenders[[1]]$data




