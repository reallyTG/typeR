library(plotrix)


### Name: clock24.plot
### Title: Plot values on a 24 hour "clockface"
### Aliases: clock24.plot
### Keywords: misc

### ** Examples

 testlen<-rnorm(24)*2+5
 testpos<-0:23+rnorm(24)/4
 clock24.plot(testlen,testpos,main="Test Clock24 (lines)",show.grid=FALSE,
  line.col="green",lwd=3)
 if(dev.interactive()) par(ask=TRUE)
 # now do a 'daylight' plot
 oldpar<-clock24.plot(testlen[7:19],testpos[7:19],
  main="Test Clock24 daytime (symbols)",
  point.col="blue",rp.type="s",lwd=3)
 # reset everything
 par(oldpar)



