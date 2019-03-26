library(sound)


### Name: sampleLength
### Title: Length of a Sample Object
### Aliases: sampleLength sampleLength<- sampleLength<-.Sample
###   setSampleLength
### Keywords: attribute

### ** Examples
## Not run: 
##D s <- Sine(440,3,rate=44100,bits=16,channels=2)
##D sampleLength(s)  # 132300 samples ( = 3 sec * 44100 samples/sec )
##D sampleLength(s) <- 22050  # sample is now .5 sec long
##D play(setSampleLength(s,44100)) # plays a .5 sec sine wave and then .5 sec silence
## End(Not run)


