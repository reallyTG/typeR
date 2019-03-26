library(log4r)


### Name: loglevel
### Title: Logging levels
### Aliases: as.character.loglevel as.loglevel as.numeric.loglevel
###   available.loglevels is.loglevel loglevel print.loglevel verbosity

### ** Examples

loglevel(2) == loglevel("INFO")
loglevel("WARN") < loglevel("ERROR")
loglevel(-1)
try(loglevel("UNDEFINED"))
is.loglevel("DEBUG")
is.loglevel(loglevel("DEBUG"))
as.numeric(loglevel("FATAL"))
available.loglevels()

## Not run: 
##D library(optparse)
##D library(log4r)
##D 
##D optlist <- list(make_option(c('-v', '--verbosity-level'),
##D   type = "integer",
##D   dest = "verbosity",
##D   default = 1,
##D   help = "Verbosity threshold (5=DEBUG, 4=INFO 3=WARN, 2=ERROR, 1=FATAL)"))
##D 
##D optparser <- OptionParser(option_list=optlist)
##D opt <- parse_args(optparser)
##D 
##D my.logger <- create.logger(logfile = "", level = verbosity(opt$verbosity))
##D 
##D fatal(my.logger, "Fatal message")
##D error(my.logger, "Error message")
##D warn(my.logger, "Warning message")
##D info(my.logger, "Informational message")
##D debug(my.logger, "Debugging message")
## End(Not run)



