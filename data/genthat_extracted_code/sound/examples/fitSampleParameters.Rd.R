library(sound)


### Name: fitSampleParameters
### Title: Adjust Parameters of Two Sample Objects.
### Aliases: fitSampleParameters
### Keywords: manip

### ** Examples
## Not run: 
##D s1 <- Sine(440,1,rate=22050,channels=1,bits=16)
##D s2 <- Sawtooth(440,1,rate=44100,channels=2,bits=8)
##D play(s1)
##D play(s2)
##D l  <- fitSampleParameters(s1,s2)
##D t1 <- l[[1]]
##D t2 <- l[[2]]
##D print(t1)
##D print(t2)  # both samples have the same parameters now
##D play(t1)
##D play(t2)   # none of the samples sounds different now,
##D            # since only parameters with higher quality were chosen
## End(Not run)


