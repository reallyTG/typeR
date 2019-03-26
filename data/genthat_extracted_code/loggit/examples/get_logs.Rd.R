library(loggit)


### Name: get_logs
### Title: Return Log File as an R Object
### Aliases: get_logs

### ** Examples

setLogFile(file.path(tempdir(), "loggit.json"), confirm = FALSE)
message("Test log message")
get_logs(getLogFile())




