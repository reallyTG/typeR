library(seewave)


### Name: wav2flac
### Title: wav-flac file conversion
### Aliases: wav2flac
### Keywords: IO

### ** Examples

## Not run: 
##D # synthesis of a 1kHz sound
##D a<-synth(d=10,f=8000,cf=1000)
##D # save it as a .wav file in the default working directory
##D savewav(a,f=8000)
##D # compress it to FLAC format and overwrite on the file a.wav
##D wav2flac("a.wav", overwrite=TRUE)
##D # back to .wav format
##D wav2flac("a.flac", reverse=TRUE)
##D # remove the files
##D unlink(c("a.wav","a.flac"))
## End(Not run)



