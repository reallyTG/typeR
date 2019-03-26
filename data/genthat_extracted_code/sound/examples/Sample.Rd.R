library(sound)


### Name: Sample
### Title: Sample Objects
### Aliases: Sample as.Sample is.Sample
### Keywords: classes

### ** Examples
## Not run: 
##D waveLeft <- 2*((seq(0,80,length=88200)%%1^2)-.5)
##D s <- as.Sample(waveLeft,44100,16)
##D play(s) # a mono sample
##D 
##D waveRight <- waveLeft[88200:1]
##D s <- as.Sample(rbind(waveLeft,waveRight),44100,16)
##D play(s) # a stereo Sample
##D 
##D # How to use is.Sample to allow both a Sample object and a filename
##D # as an argument:
##D x <- anyargument
##D sampletest <- is.Sample(x, argname="'x' ")
##D if (!sampletest$test) stop(sampletest$error) #no valid argument
##D x <- loadSample(x,filecheck=FALSE)
##D # If x is Sample object, loadSample will return it immediately.
##D # If x is a string, the Sample object will be loaded from disk.
##D # No check for existence of the file will be performed since this
##D # was already tested in is.Sample.
##D #
##D # Now x is a Sample object, continue with code.
## End(Not run)


