library(telegram.bot)


### Name: Updater
### Title: Building a Telegram Bot
### Aliases: Updater is.Updater

### ** Examples

## Not run: 
##D updater <- Updater(token = "TOKEN")
##D 
##D # In case you want to set a proxy (see ?httr:use_proxy)
##D updater <- Updater(token = "TOKEN",
##D                    request_config = httr::use_proxy(...))
##D                    
##D # Add a handler
##D start <- function(bot, update){
##D   bot$sendMessage(chat_id = update$message$chat_id,
##D                   text = sprintf("Hello %s!",
##D                                  update$message$from$first_name))
##D }
##D updater <- updater + CommandHandler("start", start)
##D 
##D # Start polling
##D updater$start_polling(verbose = TRUE) # Send '/start' to the bot
## End(Not run)



