library(googleLanguageR)


### Name: gl_speech_op
### Title: Get a speech operation
### Aliases: gl_speech_op

### ** Examples


## Not run: 
##D 
##D test_audio <- system.file("woman1_wb.wav", package = "googleLanguageR")
##D 
##D ## make an asynchronous API request (mandatory for sound files over 60 seconds)
##D asynch <- gl_speech(test_audio, asynch = TRUE)
##D 
##D ## Send to gl_speech_op() for status or finished result
##D gl_speech_op(asynch)
##D 
## End(Not run)




