library(telegram.bot)


### Name: Handler
### Title: The base of all handlers
### Aliases: Handler is.Handler

### ** Examples

## Not run: 
##D # Example of a Handler
##D callback_method <- function(bot, update){
##D   chat_id <- update$effective_chat()$id
##D   bot$sendMessage(chat_id = chat_id, text = "Hello")
##D }
##D 
##D hello_handler <- Handler(callback_method)
##D 
##D # Customizing Handler
##D check_update <- function(update){
##D   TRUE
##D }
##D 
##D handle_update <- function(update, dispatcher){
##D   self$callback(dispatcher$bot, update)
##D }
##D 
##D foo_handler <- Handler(callback_method,
##D                        check_update = check_update,
##D                        handle_update = handle_update,
##D                        handlername = 'FooHandler')
## End(Not run)



