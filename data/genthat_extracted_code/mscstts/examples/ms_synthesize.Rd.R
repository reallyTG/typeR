library(mscstts)


### Name: ms_synthesize
### Title: Get Microsoft Text To Speech (TTS) or Cognitive Services Token
###   from API Key
### Aliases: ms_synthesize ms_region

### ** Examples

## Not run: 
##D if (have_ms_tts_key()) {
##D res = ms_synthesize(
##D script = "hey, how are you doing? I'm doing pretty good",
##D output_format = "audio-16khz-128kbitrate-mono-mp3")
##D tmp <- tempfile()
##D writeBin(res$content, con = tmp)
##D mp3 = tuneR::readMP3(tmp)
##D }
##D 
## End(Not run)



