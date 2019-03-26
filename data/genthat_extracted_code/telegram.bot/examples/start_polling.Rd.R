library(telegram.bot)


### Name: start_polling
### Title: Start polling
### Aliases: start_polling

### ** Examples

## Not run: 
##D # Start polling example
##D start <- function(bot, update){
##D   bot$sendMessage(chat_id = update$message$chat_id,
##D                   text = sprintf("Hello %s!",
##D                                  update$message$from$first_name))
##D }
##D 
##D updater <- Updater("TOKEN") + CommandHandler("start", start)
##D 
##D updater$start_polling(verbose = TRUE)
## End(Not run)



