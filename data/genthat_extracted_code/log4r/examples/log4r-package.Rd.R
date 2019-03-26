library(log4r)


### Name: log4r-package
### Title: A simple logging system for R, based on log4j.
### Aliases: log4r log4r-package
### Keywords: package

### ** Examples

# Import the log4r package.
library('log4r')

# Create a new logger object with create.logger().
logger <- create.logger()

# Set the logger's file output.
logfile(logger) <- 'base.log'

# Set the current level of the logger.
level(logger) <- 'INFO'

# Try logging messages with different priorities.
# At priority level INFO, a call to debug() won't print anything.
debug(logger, 'A Debugging Message')
info(logger, 'An Info Message')
warn(logger, 'A Warning Message')
error(logger, 'An Error Message')
fatal(logger, 'A Fatal Error Message')



