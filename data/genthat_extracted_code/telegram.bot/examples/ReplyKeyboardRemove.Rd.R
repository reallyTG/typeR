library(telegram.bot)


### Name: ReplyKeyboardRemove
### Title: Remove a keyboard
### Aliases: ReplyKeyboardRemove

### ** Examples

## Not run: 
##D # Initialize bot
##D bot <- Bot(token = "TOKEN")
##D chat_id <- "CHAT_ID"
##D 
##D # Create Custom Keyboard
##D text <- "Don't forget to send me the answer!"
##D RKM <- ReplyKeyboardMarkup(
##D   keyboard = list(
##D     list(KeyboardButton("Yes, they certainly are!")),
##D     list(KeyboardButton("I'm not quite sure")),
##D     list(KeyboardButton('No...'))),
##D   resize_keyboard = FALSE,
##D   one_time_keyboard = FALSE
##D )
##D 
##D # Send Custom Keyboard
##D bot$sendMessage(chat_id, text, reply_markup = RKM)
##D 
##D # Remove Keyboard
##D bot$sendMessage(chat_id, "Okay, thanks!", reply_markup = ReplyKeyboardRemove())
## End(Not run)



