library(sound)


### Name: left
### Title: Extract one Channel from a Stereo Sample
### Aliases: left right
### Keywords: manip

### ** Examples
## Not run: 
##D sLeft <- Sine(440,1)
##D sRight <- Sine(220,1)
##D s <- stereo(sLeft,sRight)
##D play(s)
##D play(left(s))  # only the left channel
##D play(right(s)) # only the right channel
## End(Not run)


