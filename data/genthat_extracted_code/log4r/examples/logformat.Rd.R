library(log4r)


### Name: logformat
### Title: Get or set the format string for a logger object.
### Aliases: logformat logformat.logger logformat<- logformat<-.logger

### ** Examples

library('log4r')

logger <- create.logger(logfile = 'debugging.log', level = 'DEBUG')
print(logformat(logger))
logformat(logger) <- 'FORMAT STRING'



