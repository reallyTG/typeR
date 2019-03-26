library(telegram.bot)


### Name: CommandHandler
### Title: Handling commands
### Aliases: CommandHandler

### ** Examples

## Not run: 
##D 
##D # Initialize bot
##D bot <- Bot("TOKEN")
##D username <- bot$getMe()$username
##D updater <- Updater(bot = bot)
##D 
##D # Add a command
##D start <- function(bot, update){
##D   bot$sendMessage(chat_id = update$message$chat_id,
##D                   text = "Hi, I am a bot!")
##D }
##D 
##D updater <- updater + CommandHandler("start", start, username = username)
## End(Not run)



