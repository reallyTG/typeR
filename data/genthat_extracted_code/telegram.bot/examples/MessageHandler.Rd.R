library(telegram.bot)


### Name: MessageHandler
### Title: Handling messages
### Aliases: MessageHandler

### ** Examples

## Not run: 
##D callback_method <- function(bot, update){
##D   chat_id <- update$message$chat_id
##D   bot$sendMessage(chat_id = chat_id, text = 'Hello')
##D }
##D 
##D # No filtering
##D message_handler <- MessageHandler(callback_method, MessageFilters$all)
## End(Not run)



