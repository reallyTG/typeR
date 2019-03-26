library(telegram.bot)


### Name: sendMessage
### Title: Send text messages
### Aliases: sendMessage

### ** Examples

## Not run: 
##D bot <- Bot(token = bot_token("RTelegramBot"))
##D chat_id <- user_id("Me")
##D 
##D bot$sendMessage(chat_id = chat_id,
##D                 text = "foo *bold* _italic_",
##D                 parse_mode = "Markdown")
## End(Not run)



