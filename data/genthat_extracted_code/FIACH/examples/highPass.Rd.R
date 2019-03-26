library(FIACH)


### Name: highPass
### Title: SPM high pass filter
### Aliases: highPass

### ** Examples

t<-seq(1,300)
y<-cos(.01*pi*t)+.1*cos(.2*pi*t)   ## time series with low frequency drift
plot(t,y,type="l",col="red",lwd=5) ## plot it
hp.y<-highPass(y,128,2.16)        ## filter it at 128s (like in SPM) with a tr of 2.16
lines(t,hp.y,col="blue",lwd=5)     ## result has no drift
legend(x="topright",               ## Create the Legend
legend=c("Raw Signal",
         "Highpass Filtered"),
col=c("red","blue"),lwd=2)




