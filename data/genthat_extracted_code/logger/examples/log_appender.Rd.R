library(logger)


### Name: log_appender
### Title: Get or set log record appender function
### Aliases: log_appender

### ** Examples

## Not run: 
##D ## change appender to "tee" that writes to the console and a file as well
##D t <- tempfile()
##D log_appender(appender_tee(t))
##D log_info(42)
##D log_info(42:44)
##D readLines(t)
##D 
##D ## poor man's tee by stacking loggers in the namespace
##D t <- tempfile()
##D log_appender(appender_console)
##D log_appender(appender_file(t), index = 2)
##D log_info(42)
##D readLines(t)
## End(Not run)



