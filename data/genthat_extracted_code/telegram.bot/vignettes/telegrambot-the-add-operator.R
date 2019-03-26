## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ---- eval = FALSE-------------------------------------------------------
#  start <- function(bot, update){
#    bot$sendMessage(chat_id = update$message$chat_id,
#                    text = sprintf("Hello %s!",
#                                   update$message$from$first_name))
#  }
#  
#  start_handler <- CommandHandler("start", start)

## ---- eval = FALSE-------------------------------------------------------
#  updater <- Updater("TOKEN") + start_handler

## ---- eval = FALSE-------------------------------------------------------
#  echo <- function(bot, update){
#    bot$sendMessage(chat_id = update$message$chat_id,
#                    text = update$message$text)
#  }
#  
#  updater <- Updater("TOKEN") + CommandHandler("start", start) + MessageHandler(echo, MessageFilters$text)

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
#  updater$start_polling()

## ---- eval = FALSE-------------------------------------------------------
#  updater <- updater + start_handler

## ---- eval = FALSE-------------------------------------------------------
#  updater$dispatcher$add_handler(start_handler)

## ---- eval = FALSE-------------------------------------------------------
#  dispatcher <- updater$dispatcher
#  dispatcher <- dispatcher + start_handler # equivalent to dispatcher$add_handler(start_handler)

