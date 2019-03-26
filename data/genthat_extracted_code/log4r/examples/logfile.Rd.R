library(log4r)


### Name: logfile
### Title: Get or set the logfile for a logger object.
### Aliases: logfile logfile.logger logfile<- logfile<-.logger

### ** Examples

library('log4r')

logger <- create.logger()
print(logfile(logger))
logfile(logger) <- 'debug.log'
debug(logger, 'A Debugging Message')



