library(telegram.bot)


### Name: InlineKeyboardMarkup
### Title: Create an inline keyboard markup
### Aliases: InlineKeyboardMarkup

### ** Examples

## Not run: 
##D # Initialize bot
##D bot <- Bot(token = "TOKEN")
##D chat_id <- "CHAT_ID"
##D 
##D # Create Inline Keyboard
##D text <- "Could you type their phone number, please?"
##D IKM <- InlineKeyboardMarkup(
##D   inline_keyboard = list(
##D     list(InlineKeyboardButton(1),
##D          InlineKeyboardButton(2),
##D          InlineKeyboardButton(3)),
##D     list(InlineKeyboardButton(4),
##D          InlineKeyboardButton(5),
##D          InlineKeyboardButton(6)),
##D     list(InlineKeyboardButton(7),
##D          InlineKeyboardButton(8),
##D          InlineKeyboardButton(9)),
##D     list(InlineKeyboardButton("*"),
##D          InlineKeyboardButton(0),
##D          InlineKeyboardButton("#"))
##D     )
##D   )
##D 
##D # Send Inline Keyboard
##D bot$sendMessage(chat_id, text, reply_markup = IKM)
## End(Not run)



