library(ParallelLogger)


### Name: addDefaultConsoleLogger
### Title: Add the default console logger
### Aliases: addDefaultConsoleLogger

### ** Examples

logger <- addDefaultConsoleLogger()
logTrace("This event is below the threshold (INFO)")
logInfo("Hello world")                       
unregisterLogger(logger)  




