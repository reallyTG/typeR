library(sound)


### Name: center
### Title: Center a Sample Object.
### Aliases: center
### Keywords: manip

### ** Examples
## Not run: 
##D x <- seq(0,50*pi,length=10000)
##D waveform <- (sin(x))^2 + .6*cos(x/2)^2
##D s <- as.Sample(waveform,44100,16)
##D plot(s) # nice idea, but wrong range for a sample
##D play(s) # sounds ugly, too
##D s <- center(s)
##D plot(s)  # now zero is the mean
##D play(s)  # sounds good, but too quiet
##D s <- normalize(s)
##D plot(s)  # this looks like a perfect sample!
##D play(s)  # e voila!
## End(Not run)


