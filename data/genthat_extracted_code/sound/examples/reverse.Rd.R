library(sound)


### Name: reverse
### Title: Play a Sample Object Backwards
### Aliases: reverse
### Keywords: manip

### ** Examples
## Not run: 
##D waveform <- 2*((seq(0,80,length=88200)%%1^2)-.5)
##D s <- as.Sample(waveform,44100,16)
##D play(s)
##D play(reverse(s)) # now played backwards
## End(Not run)


