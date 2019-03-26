library(sound)


### Name: cutSample
### Title: Cut Sample Objects
### Aliases: cutSample [.Sample
### Keywords: manip

### ** Examples
## Not run: 
##D s <- appendSample(Sine(330,1),Sine(440,1))
##D play(cutSample(s,.8,1.8))
##D play(s[(44100*.8):(44100*1.8)])  # the same
## End(Not run)


