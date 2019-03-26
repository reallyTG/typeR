library(telegram.bot)


### Name: stop_polling
### Title: Stop polling
### Aliases: stop_polling

### ** Examples

## Not run: 
##D # Example of a 'kill' command
##D kill <- function(bot, update){
##D   bot$sendMessage(chat_id = update$message$chat_id,
##D                   text = "Bye!")
##D   # Clean 'kill' update
##D   bot$getUpdates(offset = update$update_id + 1)
##D   # Stop the updater polling
##D   updater$stop_polling()
##D }
##D 
##D updater <<- updater + CommandHandler('kill', kill)
##D 
##D updater$start_polling(verbose = TRUE) # Send '/kill' to the bot
## End(Not run)



