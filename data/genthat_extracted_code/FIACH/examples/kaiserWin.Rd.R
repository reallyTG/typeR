library(FIACH)


### Name: kaiserWin
### Title: Kaiser Window
### Aliases: kaiserWin

### ** Examples

kais<-kaiserWin(fl=.08,tw=.025,sf=1/2.16,d.sa=70,d.pbr=.1,type="low")
par(mfrow=c(2,1))
ts.plot(kais,main="Low Pass Kaiser Window")
rawPeriodogram(kais,1/2.16)



