library(sound)


### Name: normalize
### Title: Rescale the Range of a Sample to [-1,1]
### Aliases: normalize
### Keywords: manip

### ** Examples
## Not run: 
##D s <- .6*Sine(440,1)
##D plot(s)
##D plot(normalize(s)) # now it uses the full range
##D play(s)
##D play(normalize(s)) # this one is louder
## End(Not run)


