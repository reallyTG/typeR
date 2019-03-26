library(telegram.bot)


### Name: telegram.bot
### Title: Develop a Telegram Bot with R
### Aliases: telegram.bot telegram.bot-package
### Keywords: internal

### ** Examples

## Not run: 
##D library(telegram.bot)
##D 
##D start <- function(bot, update){
##D   bot$sendMessage(chat_id = update$message$chat_id,
##D                   text = sprintf("Hello %s!", update$message$from$first_name))
##D }
##D 
##D updater <- Updater("TOKEN") + CommandHandler("start", start)
##D 
##D updater$start_polling() # Send '/start' to the bot
## End(Not run)



