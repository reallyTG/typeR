library(lgr)


### Name: AppenderFile
### Title: Log to a File
### Aliases: AppenderFile

### ** Examples

logger <- Logger$new("loggername")
default <- tempfile()
fancy <- tempfile()
json <- tempfile()

logger$add_appender(AppenderFile$new(default), "default")
logger$add_appender(
  AppenderFile$new(fancy, layout = LayoutFormat$new("[%t] %c(): %L %m")), "fancy"
)
logger$add_appender(
  AppenderFile$new(json, layout = LayoutJson$new()), "json"
)

logger$info("A test message")

readLines(default)
readLines(fancy)
readLines(json)



