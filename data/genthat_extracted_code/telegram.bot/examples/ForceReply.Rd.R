library(telegram.bot)


### Name: ForceReply
### Title: Display a reply
### Aliases: ForceReply

### ** Examples

## Not run: 
##D # Initialize bot
##D bot <- Bot(token = "TOKEN")
##D chat_id <- "CHAT_ID"
##D 
##D # Set input parameters
##D text <- "Don't forget to send me the answer!"
##D 
##D # Send reply message
##D bot$sendMessage(chat_id, text, reply_markup = ForceReply())
## End(Not run)



