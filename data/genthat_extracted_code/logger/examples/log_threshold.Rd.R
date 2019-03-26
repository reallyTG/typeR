library(logger)


### Name: log_threshold
### Title: Get or set log level threshold
### Aliases: log_threshold

### ** Examples

## Not run: 
##D ## check the currently set log level threshold
##D log_threshold()
##D 
##D ## change the log level threshold to WARN
##D log_threshold(WARN)
##D log_info(1)
##D log_warn(2)
##D 
##D ## add another logger with a lower log level threshold and check the number of logged messages
##D log_threshold(INFO, index = 2)
##D log_info(1)
##D log_warn(2)
## End(Not run)



