library(FIACH)


### Name: sinc
### Title: Sinc Pulse
### Aliases: sinc

### ** Examples

par(mfrow=c(2,1))
si<-sinc(fl=.08,tw=0,type="low",n=-40:40,sf=1/2.16)
ts.plot(si,ylab="",main="Sinc Pulse")
s<-rawPeriodogram(si,1/2.16)



