library(logger)


### Name: with_log_threshold
### Title: Evaluate R expression with a temporarily updated log level
###   threshold
### Aliases: with_log_threshold

### ** Examples

## Not run: 
##D log_threshold(TRACE)
##D log_trace('Logging everything!')
##D x <- with_log_threshold({
##D   log_info('Now we are temporarily suppressing eg INFO messages')
##D   log_warn('WARN')
##D   log_debug('Debug messages are suppressed as well')
##D   log_error('ERROR')
##D   invisible(42)
##D }, threshold = WARN)
##D x
##D log_trace('DONE')
## End(Not run)



