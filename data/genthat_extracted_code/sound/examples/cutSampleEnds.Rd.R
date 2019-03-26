library(sound)


### Name: cutSampleEnds
### Title: Prepare Sample Object for appendSample
### Aliases: cutSampleEnds
### Keywords: manip

### ** Examples
## Not run: 
##D s1 <- Sine(440,.01)
##D s2 <- Sine(550,.01)
##D s3 <- Sine(660,.01)
##D s4 <- Sine(880,.01)
##D l <- list(s1,s2,s3,s4)
##D #  first without cutSampleEnds:
##D s <- nullSample()
##D for (i in 1:99) {
##D   s <- appendSample(s,l[[i%%4+1]])
##D }
##D play(s) # ugly cracks
##D # now with cutSampleEnds:
##D s <- nullSample()
##D for (i in 1:99) {
##D   s <- appendSample(s,cutSampleEnds(l[[i%%4+1]]))
##D }
##D play(s) # no cracks,
##D 
##D # This is how it works:
##D # The waveform is not smooth between s1 and s2:
##D plot(appendSample(s1,s2))
##D # This is because s1 just ends somewhere at y=0.6:
##D plot(s1)
##D # Let's cut off the last positive part of it:
##D plot(cutSampleEnds(s1))
##D # A similar cuttoff would be made at the beginning
##D # of the sample (if it was necessary).
##D # Now the two samples fit perfectly (the cut is at x=400):
##D plot(appendSample(cutSampleEnds(s1),cutSampleEnds(s2)))
## End(Not run)


