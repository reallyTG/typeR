library(seewave)


### Name: sox
### Title: Calls SoX
### Aliases: sox
### Keywords: IO

### ** Examples

## Not run: 
##D ## Generate a simple sound file at 440 Hz
##D s <- synth(cf=440, f= 8000, d=1, output="Wave")
##D savewav(s, file="mysound.wav")
##D ## Plays the file
##D sox("mysound.wav", exe="play")
##D ## Slows down  the  audio  tempo  (but  not  its  pitch)
##D sox("mysound.wav myslowsound.wav tempo 0.5")
##D ## Cuts the file
##D sox("myslowsound.wav myslowcuttedsound.wav trim 0.25 0.75")
##D ## Deletes example files
##D file.remove("mysound.wav", "myslowsound.wav", "myslowcuttedsound.wav")
## End(Not run)



