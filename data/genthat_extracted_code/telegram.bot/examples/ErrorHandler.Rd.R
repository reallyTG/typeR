library(telegram.bot)


### Name: ErrorHandler
### Title: Handling errors
### Aliases: ErrorHandler is.ErrorHandler

### ** Examples

## Not run: 
##D updater <- Updater(token = "TOKEN")
##D 
##D # Create error callback
##D error_callback <- function(bot, error){
##D   warning(simpleWarning(conditionMessage(error), call = "Updates polling"))
##D }
##D 
##D # Register it to the updater's dispatcher
##D updater$dispatcher$add_handler(ErrorHandler(error_callback))
##D # or
##D updater <- updater + ErrorHandler(error_callback)
## End(Not run)



