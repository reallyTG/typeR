library(logger)


### Name: logger
### Title: Generate logging utility
### Aliases: logger

### ** Examples

## Not run: 
##D do.call(logger, logger:::namespaces$global[[1]])(INFO, 42)
##D do.call(logger, logger:::namespaces$global[[1]])(INFO, '{pi}')
##D x <- 42
##D do.call(logger, logger:::namespaces$global[[1]])(INFO, '{x}^2 = {x^2}')
## End(Not run)



