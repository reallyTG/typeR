library(telegram.bot)


### Name: ReplyKeyboardMarkup
### Title: Create a keyboard markup
### Aliases: ReplyKeyboardMarkup

### ** Examples

## Not run: 
##D # Initialize bot
##D bot <- Bot(token = "TOKEN")
##D chat_id <- "CHAT_ID"
##D 
##D # Create Custom Keyboard
##D text <- "Aren't those custom keyboards cool?"
##D RKM <- ReplyKeyboardMarkup(
##D   keyboard = list(
##D     list(KeyboardButton("Yes, they certainly are!")),
##D     list(KeyboardButton("I'm not quite sure")),
##D     list(KeyboardButton('No...'))),
##D   resize_keyboard = FALSE,
##D   one_time_keyboard = TRUE
##D )
##D 
##D # Send Custom Keyboard
##D bot$sendMessage(chat_id, text, reply_markup = RKM)
## End(Not run)



