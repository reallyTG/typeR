library(ParallelLogger)


### Name: layoutTimestamp
### Title: Logging layout with timestamp
### Aliases: layoutTimestamp

### ** Examples

appender <- createConsoleAppender(layout = layoutTimestamp)

logger <- createLogger(name = "SIMPLE",
                       threshold = "INFO",
                       appenders = list(appender))
registerLogger(logger)                      
logTrace("This event is below the threshold (INFO)")
logInfo("Hello world")                       
unregisterLogger("SIMPLE")                     



