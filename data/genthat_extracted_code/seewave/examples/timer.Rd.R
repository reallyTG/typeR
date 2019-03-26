library(seewave)


### Name: timer
### Title: Time measurements of a time wave
### Aliases: timer
### Keywords: dplot ts

### ** Examples

data(tico)
timer(tico,f=22050,threshold=5,msmooth=c(50,0))
# to compare with an oscillographic representation
data(orni)
op<-par(mfrow=c(2,1))
timer(orni,f=22050,threshold=5,msmooth=c(40,0),tck=0.05,
        bty="l",colval="blue")
title(main="A cicada song made of five echemes",col="blue")
oscillo(orni,f=22050,k=1,j=1)
par(op)



