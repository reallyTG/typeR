library(telegram.bot)


### Name: getFile
### Title: Prepare a file for downloading
### Aliases: getFile

### ** Examples

## Not run: 
##D bot <- Bot(token = bot_token("RTelegramBot"))
##D chat_id <- user_id("Me")
##D 
##D photos <- bot$getUserProfilePhotos(chat_id = chat_id)
##D 
##D # Download user profile photo
##D file_id <- photos$photos[[1L]][[1L]]$file_id
##D bot$getFile(file_id, destfile = "photo.jpg")
## End(Not run)



