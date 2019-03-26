## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ---- eval = FALSE-------------------------------------------------------
#  handler <- MessageHandler(callback, MessageFilters$video | MessageFilters$photo | MessageFilters$document)

## ---- eval = FALSE-------------------------------------------------------
#  handler <- MessageHandler(callback, MessageFilters$forwarded & MessageFilters$photo)

## ---- eval = FALSE-------------------------------------------------------
#  handler <- MessageHandler(callback, MessageFilters$photo & (! MessageFilters$forwarded))

## ---- eval = FALSE-------------------------------------------------------
#  filter_user <- function(message) message$from_user  == "USER_ID"

## ---- eval = FALSE-------------------------------------------------------
#  filter_user <- BaseFilter(filter = filter_user)

## ---- eval = FALSE-------------------------------------------------------
#  filter_user <- as.BaseFilter(function(message) message$from_user  == "USER_ID")

## ---- eval = FALSE-------------------------------------------------------
#  kill_handler <- CommandHandler("kill", kill, filter_user)

## ---- eval = FALSE-------------------------------------------------------
#  MessageFilters$text_or_command <- BaseFilter(function(message) !is.null(message$text))

## ---- eval = FALSE-------------------------------------------------------
#  handler <- MessageHandler(callback, MessageFilters$text_or_command)

