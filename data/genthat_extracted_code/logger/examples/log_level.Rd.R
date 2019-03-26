library(logger)


### Name: log_level
### Title: Log a message with given log level
### Aliases: log_level log_fatal log_error log_warn log_success log_info
###   log_debug log_trace

### ** Examples

## Not run: 
##D log_level(INFO, 'hi there')
##D log_info('hi there')
##D 
##D ## output omitted
##D log_debug('hi there')
##D 
##D ## lower threshold and retry
##D log_threshold(TRACE)
##D log_debug('hi there')
##D 
##D ## multiple lines
##D log_info('ok {1:3} + {1:3} = {2*(1:3)}')
##D 
##D log_layout(layout_json())
##D log_info('ok {1:3} + {1:3} = {2*(1:3)}')
##D 
##D ## note for the JSON output, glue is not automatically applied
##D log_info(glue::glue('ok {1:3} + {1:3} = {2*(1:3)}'))
## End(Not run)



