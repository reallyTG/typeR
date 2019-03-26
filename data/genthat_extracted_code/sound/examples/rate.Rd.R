library(sound)


### Name: rate
### Title: The Sampling Rate
### Aliases: rate rate<- setRate
### Keywords: attribute

### ** Examples
## Not run: 
##D s <- Sine(440,1,rate=44100)
##D rate(s)  # 44100
##D play(s)
##D print(s)
##D rate(s) <- 8000
##D play(s)  # s has worse quality now (noise and additional high frequencies)
##D print(s) # but uses less memory
## End(Not run)


