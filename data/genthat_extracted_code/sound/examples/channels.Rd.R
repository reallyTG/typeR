library(sound)


### Name: channels
### Title: Number of Channels of a Sample Object
### Aliases: channels channels<- setChannels
### Keywords: attribute

### ** Examples
## Not run: 
##D s <- stereo(Sine(440,1),Sine(220,1))
##D channels(s)  # 2
##D play(s)
##D channels(s) <- 1  # now a mono sample
##D play(s)
## End(Not run)


