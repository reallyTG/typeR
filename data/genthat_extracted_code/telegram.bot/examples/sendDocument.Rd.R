library(telegram.bot)


### Name: sendDocument
### Title: Send general files
### Aliases: sendDocument

### ** Examples

## Not run: 
##D bot <- Bot(token = bot_token("RTelegramBot"))
##D chat_id <- user_id("Me")
##D document_url <- "https://github.com/ebeneditos/telegram.bot/raw/gh-pages/docs/telegram.bot.pdf"
##D 
##D bot$sendDocument(chat_id = chat_id,
##D                  document = document_url)
## End(Not run)



