library(Rtts)


### Name: tts_ITRI_getURL
### Title: Get URL of Voice File from ITRI TTS service via SOAP
### Aliases: tts_ITRI_getURL

### ** Examples

text <- "Hello."
ID <- tts_ITRI_getID(text, speed=0, volume=100, speaker="Bruce")
voice_url <- tts_ITRI_getURL(ID)



