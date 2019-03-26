library(sound)


### Name: noSilence
### Title: Cut Off Silence from a Sample Object
### Aliases: noSilence
### Keywords: manip

### ** Examples
## Not run: 
##D s <- Sine(440,5)
##D sound(s) <- sound(s)*matrix(seq(1,0,length=5*44100),nrow=1)
##D sampleLength(s)
##D play(s) # fade out
##D s <- noSilence(s,level=.05)
##D sampleLength(s)  # s is shorter now
##D play(s)    # although you don't hear that the end is missing
## End(Not run)


