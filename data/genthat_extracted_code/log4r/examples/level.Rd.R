library(log4r)


### Name: level
### Title: Set or get the priority level for a logger object.
### Aliases: level level.logger level<- level<-.logger

### ** Examples

library('log4r')

logger <- create.logger(logfile = 'debugging.log', level = 1)
level(logger)
level(logger) <- "FATAL"



