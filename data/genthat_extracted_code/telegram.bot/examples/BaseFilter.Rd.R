library(telegram.bot)


### Name: BaseFilter
### Title: The base of all filters
### Aliases: BaseFilter as.BaseFilter is.BaseFilter

### ** Examples

## Not run: 
##D # Create a filter function
##D text_or_command <- function(message) !is.null(message$text)
##D 
##D # Make it an instance of BaseFilter with its generator:
##D text_or_command <- BaseFilter(filter = text_or_command)
##D 
##D # Or by coercing it with as.BaseFilter:
##D text_or_command <- as.BaseFilter(function(message) !is.null(message$text))
## End(Not run)



