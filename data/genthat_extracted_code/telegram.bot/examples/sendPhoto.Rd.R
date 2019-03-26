library(telegram.bot)


### Name: sendPhoto
### Title: Send image files
### Aliases: sendPhoto

### ** Examples

## Not run: 
##D bot <- Bot(token = bot_token("RTelegramBot"))
##D chat_id <- user_id("Me")
##D photo_url <- "https://telegram.org/img/t_logo.png"
##D 
##D bot$sendPhoto(chat_id = chat_id,
##D               photo = photo_url,
##D               caption = "Telegram Logo")
## End(Not run)



