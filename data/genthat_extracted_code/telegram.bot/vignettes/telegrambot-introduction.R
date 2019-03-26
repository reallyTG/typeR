## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ---- eval = FALSE-------------------------------------------------------
#  # install.packages("telegram.bot")
#  library(telegram.bot)
#  
#  bot <- Bot(token = "TOKEN")

## ---- eval = FALSE-------------------------------------------------------
#  print(bot$getMe())

## ---- eval = FALSE-------------------------------------------------------
#  updates <- bot$getUpdates()

## ---- eval = FALSE-------------------------------------------------------
#  chat_id <- "CHAT_ID" # you can retrieve it from bot$getUpdates() after sending a message to the bot
#  bot$sendMessage(chat_id = chat_id, text = "TestReply")

## ---- eval = FALSE-------------------------------------------------------
#  # Send message
#  bot$sendMessage(chat_id = chat_id,
#                  text = "foo *bold* _italic_",
#                  parse_mode = "Markdown")
#  
#  # Send photo
#  bot$sendPhoto(chat_id = chat_id,
#                 photo = "https://telegram.org/img/t_logo.png")
#  
#  # Send audio
#  bot$sendAudio(chat_id = chat_id,
#                audio = "http://www.largesound.com/ashborytour/sound/brobob.mp3")
#  
#  # Send document
#  bot$sendDocument(chat_id = chat_id,
#                   document = "https://github.com/ebeneditos/telegram.bot/raw/gh-pages/docs/telegram.bot.pdf")
#  
#  # Send sticker
#  bot$sendSticker(chat_id = chat_id,
#                  sticker = "https://www.gstatic.com/webp/gallery/1.webp")
#  
#  # Send video
#  bot$sendVideo(chat_id = chat_id,
#                video = "http://techslides.com/demos/sample-videos/small.mp4")
#  
#  # Send gif
#  bot$sendAnimation(chat_id = chat_id,
#                    animation = "https://media.giphy.com/media/sIIhZliB2McAo/giphy.gif")
#  
#  # Send location
#  bot$sendLocation(chat_id = chat_id,
#                   latitude = 51.521727,
#                   longitude = -0.117255)
#  
#  # Send chat action
#  bot$sendChatAction(chat_id = chat_id,
#                     action = "typing")
#  
#  # Get user profile photos
#  photos <- bot$getUserProfilePhotos(user_id = chat_id)
#  
#  # Download user profile photo
#  file_id <- photos$photos[[1L]][[1L]]$file_id
#  bot$getFile(file_id, destfile = "photo.jpg")

