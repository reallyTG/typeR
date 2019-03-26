library(PWFSLSmoke)


### Name: logger.setup
### Title: Set Up Python-Style Logging
### Aliases: logger.setup

### ** Examples

## Not run: 
##D # Only save three log files
##D logger.setup(debugLog='debug.log', infoLog='info.log', errorLog='error.log')
##D 
##D # But allow lot statements at all levels within the code
##D logger.trace('trace statement #%d', 1)
##D logger.debug('debug statement')
##D logger.info('info statement %s %s', "with", "arguments")
##D logger.warn('warn statement %s', "about to try something dumb")
##D result <- try(1/"a", silent=TRUE)
##D logger.error('error message: %s', geterrmessage())
##D logger.fatal('fatal statement %s', "THE END")
## End(Not run)



