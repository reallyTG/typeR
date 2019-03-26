library(googleLanguageR)


### Name: gl_speech
### Title: Call Google Speech API
### Aliases: gl_speech

### ** Examples


## Not run: 
##D 
##D test_audio <- system.file("woman1_wb.wav", package = "googleLanguageR")
##D result <- gl_speech(test_audio)
##D 
##D result$transcript
##D result$timings
##D 
##D result2 <- gl_speech(test_audio, maxAlternatives = 2L)
##D result2$transcript
##D 
##D result_brit <- gl_speech(test_audio, languageCode = "en-GB")
##D 
##D 
##D ## make an asynchronous API request (mandatory for sound files over 60 seconds)
##D asynch <- gl_speech(test_audio, asynch = TRUE)
##D 
##D ## Send to gl_speech_op() for status or finished result
##D gl_speech_op(asynch)
##D 
##D ## Upload to GCS bucket for long files > 60 seconds
##D test_gcs <- "gs://mark-edmondson-public-files/googleLanguageR/a-dream-mono.wav"
##D gcs <- gl_speech(test_gcs, sampleRateHertz = 44100L, asynch = TRUE)
##D gl_speech_op(gcs)
## End(Not run)





