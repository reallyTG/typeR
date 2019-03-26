## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ---- eval = FALSE-------------------------------------------------------
#  library(telegram.bot)
#  
#  updater <- Updater(token = "TOKEN")

## ---- eval = FALSE-------------------------------------------------------
#  file.edit(path.expand(file.path("~", ".Renviron")))

## ---- eval = FALSE-------------------------------------------------------
#  R_TELEGRAM_BOT_RTelegramBot=TOKEN

## ---- eval = FALSE-------------------------------------------------------
#  updater <- Updater(token = bot_token("RTelegramBot"))

## ---- eval = FALSE-------------------------------------------------------
#  start <- function(bot, update){
#    bot$sendMessage(chat_id = update$message$chat_id,
#                    text = sprintf("Hello %s!", update$message$from$first_name))
#  }

## ---- eval = FALSE-------------------------------------------------------
#  start_handler <- CommandHandler("start", start)
#  updater <- updater + start_handler

## ---- eval = FALSE-------------------------------------------------------
#  updater$start_polling()

