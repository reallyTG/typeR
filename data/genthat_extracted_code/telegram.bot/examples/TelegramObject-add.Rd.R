library(telegram.bot)


### Name: +.TelegramObject
### Title: Constructing an Updater
### Aliases: +.TelegramObject add

### ** Examples

## Not run: 
##D # You can chain multiple handlers
##D start <- function(bot, update){
##D   bot$sendMessage(chat_id = update$message$chat_id,
##D                   text = sprintf("Hello %s!",
##D                                  update$message$from$first_name))
##D }
##D echo <- function(bot, update){
##D   bot$sendMessage(chat_id = update$message$chat_id,
##D                   text = update$message$text)
##D }
##D 
##D updater <- Updater("TOKEN") + CommandHandler("start", start) +
##D   MessageHandler(echo, MessageFilters$text)
##D   
##D # And keep adding...
##D caps <- function(bot, update, args){
##D   if (length(args > 0L)){
##D     text_caps <- toupper(paste(args, collapse = " "))
##D     bot$sendMessage(chat_id = update$message$chat_id,
##D                     text = text_caps) 
##D   }
##D }
##D 
##D updater <- updater + CommandHandler("caps", caps, pass_args = TRUE)
##D 
##D # Give it a try!
##D updater$start_polling()
##D # Send '/start' to the bot, '/caps foo' or just a simple text
## End(Not run)



