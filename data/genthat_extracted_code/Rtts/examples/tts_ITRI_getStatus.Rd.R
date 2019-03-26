library(Rtts)


### Name: tts_ITRI_getStatus
### Title: Check the Text-To-Speech Convertion Progress Status
### Aliases: tts_ITRI_getStatus

### ** Examples

text <- "Hello."
ID <- tts_ITRI_getID(text, speed=0, volume=100, speaker="Bruce")
tts_ITRI_getStatus(ID)



