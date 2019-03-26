library(ParallelLogger)


### Name: logInfo
### Title: Log a message at the INFO level
### Aliases: logInfo

### ** Examples

appender <- createConsoleAppender(layout = layoutTimestamp)

logger <- createLogger(name = "SIMPLE",
                       threshold = "INFO",
                       appenders = list(appender))
registerLogger(logger)                      
logTrace("This event is below the threshold (INFO)")
logInfo("Hello world")                       
unregisterLogger("SIMPLE")                     



