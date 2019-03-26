library(seewave)


### Name: revw
### Title: Time reverse of a time wave
### Aliases: revw
### Keywords: dplot ts

### ** Examples

data(tico)
# simple reverse
revw(tico,f=22050,plot=TRUE)
# envelope reverse only
revw(tico,f=22050,ifreq=FALSE, plot=TRUE)
# instantaneous frequency reverse only
revw(tico,f=22050,env=FALSE, plot=TRUE)



