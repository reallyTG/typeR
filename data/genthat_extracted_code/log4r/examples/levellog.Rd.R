library(log4r)


### Name: levellog
### Title: Write messages to logs at a given priority level.
### Aliases: debug error fatal info levellog warn

### ** Examples

library('log4r')

logger <- create.logger(logfile = 'debugging.log', level = "WARN")

levellog(logger, 'WARN', 'First warning from our code')
debug(logger, 'Debugging our code')
info(logger, 'Information about our code')
warn(logger, 'Another warning from our code')
error(logger, 'An error from our code')
fatal(logger, 'I\'m outta here')



