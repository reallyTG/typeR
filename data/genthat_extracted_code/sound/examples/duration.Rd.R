library(sound)


### Name: duration
### Title: Duration of a Sample Object
### Aliases: duration duration<- setDuration
### Keywords: attribute

### ** Examples
## Not run: 
##D s <- Sine(440,3)
##D duration(s)  # 3
##D duration(s) <-.5  # sample is now .5 sec long
##D play(setDuration(s,1)) # plays a .5 sec sine wave and then .5 sec silence
## End(Not run)


