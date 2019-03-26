library(sound)


### Name: sound
### Title: The Waveform Matrix of a Sample Object
### Aliases: sound sound<-
### Keywords: attribute

### ** Examples
## Not run: 
##D s <- Sine(440,1,channels=2)  # stereo sine wave
##D sound(s)[2,] <- sound(s)[2,]*seq(1,0,length=sampleLength(s))
##D play(s)  # right channel fades to zero
## End(Not run)


