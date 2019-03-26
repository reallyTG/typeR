## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ---- eval = FALSE-------------------------------------------------------
#  echo <- function(bot, update){
#  	bot$sendMessage(chat_id = update$message$chat_id, text = update$message$text)
#  }
#  
#  updater <- updater + MessageHandler(echo, MessageFilters$text)

## ---- eval = FALSE-------------------------------------------------------
#  caps <- function(bot, update, args){
#    if (length(args > 0L)){
#     	text_caps <- toupper(paste(args, collapse = " "))
#     	bot$sendMessage(chat_id = update$message$chat_id,
#     	                text = text_caps)
#    }
#  }
#  
#  updater <- updater + CommandHandler("caps", caps, pass_args = TRUE)

## ---- eval = FALSE-------------------------------------------------------
#  unknown <- function(bot, update){
#  	bot$sendMessage(chat_id = update$message$chat_id,
#                          text = "Sorry, I didn't understand that command.")
#  }
#  
#  updater <- updater + MessageHandler(unknown, MessageFilters$command)

## ---- eval = FALSE-------------------------------------------------------
#  # Example of a 'kill' command
#  kill <- function(bot, update){
#    bot$sendMessage(chat_id = update$message$chat_id,
#                    text = "Bye!")
#    # Clean 'kill' update
#    bot$getUpdates(offset = update$update_id + 1L)
#    # Stop the updater polling
#    updater$stop_polling()
#  }
#  
#  updater <<- updater + CommandHandler("kill", kill)

