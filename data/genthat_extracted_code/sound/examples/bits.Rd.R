library(sound)


### Name: bits
### Title: Bits per Sample
### Aliases: bits bits<- setBits
### Keywords: attribute

### ** Examples
## Not run: 
##D s <- Sine(20000,1,rate=44100,bits=16)
##D play(s)
##D print(s)
##D bits(s) <- 8
##D play(s)  # now worse quality
##D print(s) # but less disk space
##D play(setBits(s,16)) # now better quality again, since waveform data was not changed.
## End(Not run)


