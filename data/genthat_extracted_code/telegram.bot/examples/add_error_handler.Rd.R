library(telegram.bot)


### Name: add_error_handler
### Title: Add an error handler
### Aliases: add_error_handler

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
##D updater$dispatcher$add_error_handler(error_callback)
##D # or
##D updater$dispatcher$add_handler(ErrorHandler(error_callback))
##D # or
##D updater <- updater + ErrorHandler(error_callback)
## End(Not run)



